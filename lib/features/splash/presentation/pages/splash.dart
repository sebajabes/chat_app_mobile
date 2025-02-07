import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../auth/auth.dart';
import '../../../chat_list/chat_list.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool init = false;
  @override
  void didChangeDependencies() {
    initialize();
    super.didChangeDependencies();
  }

  initialize() async {
    if (!init) {
      await Future.delayed(Duration(milliseconds: 500));

      if (!mounted) return;

      final authState = context.read<AuthBloc>().state;

      eLog(authState);

      final generatedRoute = authState.isAuthenticated
          ? ChatListPage.routeName
          : AuthPage.routeName;

      Navigator.pushReplacementNamed(context, generatedRoute);

      init = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlankPage(isLoading: true),
    );
  }
}
