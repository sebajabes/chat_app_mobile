import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../../../core/core.dart';
import '../../../chat_list/presentation/pages/chat_list.dart';
import '../cubit/guest_cubit.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = 'auth';

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuestCubit>();
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: FlutterLogin(
        
        theme: LoginTheme(
          pageColorLight: Colors.indigo,
          titleStyle: TextStyle(
            color: AppColors.button,
          ),
        ),
        scrollable: true,
        title: 'Chat App',
        logo: const AssetImage(AppVariables.chatIcon),
        passwordValidator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
        userValidator: (value) {
          if (!value!.contains('@')) {
            return 'Email must contain @';
          }
          return null;
        },
        onLogin: cubit.authUser,
        onSignup: cubit.registerUser,
        hideForgotPasswordButton: true,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacementNamed(ChatListPage.routeName);
        },
        onRecoverPassword: (_) {
          return;
        },
      ),
    );
  }
}
