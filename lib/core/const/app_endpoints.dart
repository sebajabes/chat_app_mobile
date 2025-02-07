class Endpoints {
  static const baseUrl = 'http://192.168.0.106:8000';
  static const apiVersion = '/api';

  static const baseAuth = '$apiVersion/auth';
  static const register = '$baseAuth/register';
  static const login = '$baseAuth/login';
  static const loginWithToken = '$baseAuth/login_with_token';
  static const logout = '$baseAuth/logout';

  static const baseChat = '$apiVersion/chat';
  static const getSingleChat = '$baseChat/';

  static const baseChatMessage = '$apiVersion/chat_message';

  static const getUser = '$apiVersion/user';
}
