import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../data/data.dart';
import '../bloc/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_state.dart';
part 'guest_cubit.freezed.dart';

class GuestCubit extends Cubit<GuestState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;
  GuestCubit({
    required AuthRepository authRepository,
    required AuthBloc authBloc,
  })  : _authRepository = authRepository,
        _authBloc = authBloc,
        super(GuestState.initial());

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> authUser(LoginData data) async {
    final response = await _authRepository.login(
      LoginRequest(email: data.name, password: data.password),
    );

    if (response.success) {
      _authBloc.add(AuthEvent.authenticated(
          isAuthenticated: true,
          user: response.data!.user,
          token: response.data!.token));
      return null;
    }

    return response.message;
  }

  Future<String?> registerUser(SignupData data) async {
    final response = await _authRepository.register(
      RegisterRequest(
        email: data.name!,
        password: data.password!,
        passwordConfirmation: data.password!,
      ),
    );

    if (response.success) {
      _authBloc.add(AuthEvent.authenticated(
          isAuthenticated: true,
          user: response.data!.user,
          token: response.data!.token));
      return null;
    }

    return response.message;
  }

  Future<void> logoutUser() async {
    _authRepository.logout();
    _authBloc.add(AuthEvent.authenticated(
      isAuthenticated: false,
      user: null,
      token: null,
    ));
  }
}
