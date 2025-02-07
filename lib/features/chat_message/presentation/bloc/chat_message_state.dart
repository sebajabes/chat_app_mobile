part of 'chat_message_bloc.dart';

abstract class ChatMessageState extends Equatable {
  const ChatMessageState();  

  @override
  List<Object> get props => [];
}
class ChatMessageInitial extends ChatMessageState {}
