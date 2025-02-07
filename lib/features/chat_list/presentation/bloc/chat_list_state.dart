part of 'chat_list_bloc.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState({
    required List<ChatModel> chats,
    required ChatModel? selectedChat,
    required DataStatus status,
    required String message,
  }) = _ChatListState;
  factory ChatListState.initial() {
    return ChatListState(
      chats: [],
      selectedChat: null,
      status: DataStatus.initial,
      message: '',
    );
  }
}
