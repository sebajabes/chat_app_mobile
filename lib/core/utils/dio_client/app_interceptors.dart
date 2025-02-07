import 'dart:io';

import '../../../features/auth/auth.dart';
import 'package:dio/dio.dart';

import '../../core.dart';

class AppInterceptors extends Interceptor {
  static AppInterceptors? _singleton;

  AppInterceptors._internal();

  factory AppInterceptors() {
    return _singleton ??= AppInterceptors._internal();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      // const fakeToken = 'fakeToken';
      final state = AuthBloc().state;

      if (state.token != null) {
        options.headers[HttpHeaders.authorizationHeader] =
            'Bearer ${state.token}';
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final responseData = mapResponseData(
      requestOption: response.requestOptions,
      response: response,
    );

    return handler.resolve(responseData);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorMessage = getErrorMessage(
      err.type,
      err.response?.statusCode,
    );

    final responseData = mapResponseData(
      requestOption: err.requestOptions,
      customMessage: errorMessage,
      isErrorResponse: true,
      response: err.response,
    );

    return handler.resolve(responseData);
  }
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  required RequestOptions requestOption,
  String customMessage = '',
  bool isErrorResponse = false,
}) {
  final bool hasResponseData = response?.data != null;

  Map<String, dynamic> responseData = response?.data;

  if (hasResponseData) {
    responseData.addAll({
      'statusCode': response?.statusCode,
      'statusMessage': response?.statusMessage,
    });
  }

  return Response(
    requestOptions: requestOption,
    data: hasResponseData
        ? responseData
        : AppResponse(
            success: isErrorResponse ? false : true,
            message: customMessage,
            statusCode: response?.statusCode,
            statusMessage: response?.statusMessage,
          ).toJson(
            (value) => null,
          ),
  );
}

String getErrorMessage(DioExceptionType errorType, int? statusCode) {
  String errorMessage = "";
  switch (errorType) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      errorMessage = DioErrorMessage.deadlineExceededException;
      break;
    case DioExceptionType.badResponse:
      switch (statusCode) {
        case 400:
          errorMessage = DioErrorMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioErrorMessage.unauthorizedException;
          break;
        case 404:
          errorMessage = DioErrorMessage.notFoundException;
          break;
        case 409:
          errorMessage = DioErrorMessage.conflictException;
          break;
        case 500:
          errorMessage = DioErrorMessage.internalServerErrorException;
          break;
      }
      break;
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
      errorMessage = DioErrorMessage.unexpectedException;
      break;
    case DioExceptionType.badCertificate:
      errorMessage = DioErrorMessage.badRequestException;
      break;
    case DioExceptionType.connectionError:
      errorMessage = DioErrorMessage.internalServerErrorException;
      break;
  }
  return errorMessage;
}

class DioErrorMessage {
  static const badRequestException = 'Invalid request';
  static const internalServerErrorException =
      'Unknown error occurred. Please try again later';
  static const conflictException =
      'Conflict error occurred. Please try again later';
  static const notFoundException = 'The requested resource was not found';
  static const unauthorizedException = 'Unauthorized access';
  static const forbiddenException = 'Forbidden access';
  static const unexpectedException =
      'An unexpected error occurred. Please try again later';
  static const noInternetConnection =
      'No internet connection. Please check your connection and try again';
  static const deadlineExceededException =
      'The connection has timed out. Please try again later';
}
