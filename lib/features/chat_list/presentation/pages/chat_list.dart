import '../../chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_page/search_page.dart';

import '../../../../core/core.dart';
import '../../../auth/auth.dart';
import '../../../user/user.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  static const routeName = 'chat-list';
  @override
  Widget build(BuildContext context) {
    // final authState = context.read<AuthBloc>().state;
    // eLog(authState);
    final authBloc = context.read<AuthBloc>();
    final currentUser = authBloc.state.user;
    final chatBloc = context.read<ChatListBloc>();
    return StartupContainer(
      onInit: () async {
        chatBloc.add(ChatStarted());
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Chat List\n${currentUser?.username}',
          action: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (!state.isAuthenticated) {
                  Navigator.pushReplacementNamed(context, AuthPage.routeName);
                }
              },
              child: IconButton(
                icon: Icon(Icons.logout_outlined),
                onPressed: () {
                  context.read<GuestCubit>().logoutUser();
                },
              ),
            )
          ],
        ),
        body: BlocConsumer<ChatListBloc, ChatListState>(
          listener: (context, state) {},
          builder: (context, state) {
            eLog(state.chats);
            if (state.chats.isEmpty) {
              return BlankPage(
                content: 'No chats available',
                icon: Icons.chat_outlined,
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                return CustomText(text: 'Hello');
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.5,
                );
              },
              itemCount: state.chats.length,
            );
          },
        ),
        floatingActionButton:
            BlocSelector<UserBloc, UserState, List<UserModel?>>(
          selector: (state) {
            return state.map(
              initial: (value) => [],
              loaded: (value) => value.users,
            );
          },
          builder: (context, state) {
            eLog(state);

            return FloatingActionButton(
              onPressed: () => _showSearch(context, []),
              child: Icon(Icons.search_rounded),
            );
          },
        ),
      ),
    );
  }

  _showSearch(BuildContext context, List<UserModel> users) {
    return showSearch(
      context: context,
      delegate: SearchPage<UserModel>(
        builder: (user) {
          return ListTile(
            title: CustomText(text: user.email),
            subtitle: CustomText(text: user.username),
          );
        },
        filter: (user) {
          return [
            user.email,
          ];
        },
        items: users,
        searchLabel: 'Search User',
      ),
    );
  }
}
