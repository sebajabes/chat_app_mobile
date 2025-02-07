import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../../data/repositories/repositories.dart';

part 'chat_list_bloc.freezed.dart';
part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final CreateChatRepository _createChatRepository;
  ChatListBloc({
    required CreateChatRepository createChatRepository,
  })  : _createChatRepository = createChatRepository,
        super(ChatListState.initial()) {
    on<ChatStarted>(chatStarted);
    on<ChatReset>(chatReset);
  }

  chatStarted(ChatListEvent event, Emitter<ChatListState> emit) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: DataStatus.loading));

    final result = await _createChatRepository.getChats();

    emit(state.copyWith(
      status: DataStatus.loaded,
      chats: result.success ? result.data! : [],
      message: result.message,
    ));
  }

  chatReset(ChatListEvent event, Emitter<ChatListState> emit) async {
    emit(ChatListState.initial());
  }
}
