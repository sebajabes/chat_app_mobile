import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../../chat_list.dart';

class CreateChatRepository extends BaseChatRepository {
  CreateChatRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;
  @override
  Future<AppResponse<ChatModel?>> createChat(CreateChatRequest request) async {
    final response = await _dioClient.post(
      Endpoints.baseChat,
      data: request.toJson(),
    );

    return AppResponse<ChatModel?>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          print('HEREEEEE $json');
          return ChatModel.fromJson(json);
        }
        return null;
      },
    );
  }

  @override
  Future<AppResponse<List<ChatModel>>> getChats() async {
    final response = await _dioClient.get(Endpoints.baseChat);

    return AppResponse<List<ChatModel>>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          return (json as List<dynamic>)
              .map((e) => ChatModel.fromJson(e))
              .toList();
        }
        return [];
      },
    );
  }

  @override
  Future<AppResponse<ChatModel?>> getSingleChat(int chatId) async {
    final response = await _dioClient.get(
      '${Endpoints.baseChat}/$chatId',
    );

    return AppResponse<ChatModel?>.fromJson(response.data, (dynamic json) {
      if (json != null && response.data['success']) {
        return ChatModel.fromJson(json);
      }
      return null;
    });
  }
}
