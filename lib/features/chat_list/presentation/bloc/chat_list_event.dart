part of 'chat_list_bloc.dart';

@freezed
class ChatListEvent with _$ChatListEvent {
  const factory ChatListEvent.started() = ChatStarted;
  const factory ChatListEvent.reset() = ChatReset;
}
