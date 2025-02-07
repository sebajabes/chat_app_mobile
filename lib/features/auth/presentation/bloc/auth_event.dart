part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authenticated({
    UserModel? user,
    String? token,
    required bool isAuthenticated,
  }) = Authenticated;
}
