import 'features/chat_list/data/repositories/repositories.dart';
import 'features/chat_list/presentation/bloc/chat_list_bloc.dart';
import 'features/splash/presentation/pages/splash.dart';
import 'features/user/data/data.dart';
import 'features/user/presentation/bloc/user_bloc.dart';

import 'features/auth/data/data.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/cubit/guest_cubit.dart';
import 'features/chat_list/presentation/pages/chat_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'features/auth/presentation/pages/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path));
  runApp(const ChatAppMobile());
}

class ChatAppMobile extends StatelessWidget {
  const ChatAppMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<CreateChatRepository>(
          create: (context) => CreateChatRepository(),
        ),
        RepositoryProvider<UserRepository>(
            create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<GuestCubit>(
              create: (context) => GuestCubit(
                  authRepository: context.read<AuthRepository>(),
                  authBloc: context.read<AuthBloc>())),
          BlocProvider<ChatListBloc>(
              create: (context) => ChatListBloc(
                  createChatRepository: context.read<CreateChatRepository>())),
          BlocProvider<UserBloc>(
              create: (context) =>
                  UserBloc(userRepository: context.read<UserRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: AppVariables.fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: SplashPage.routeName,
          routes: {
            SplashPage.routeName: (_) => const SplashPage(),
            AuthPage.routeName: (_) => const AuthPage(),
            ChatListPage.routeName: (_) => const ChatListPage(),
          },
        ),
      ),
    );
  }
}
