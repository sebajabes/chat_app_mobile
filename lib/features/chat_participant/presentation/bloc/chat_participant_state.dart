part of 'chat_participant_bloc.dart';

abstract class ChatParticipantState extends Equatable {
  const ChatParticipantState();  

  @override
  List<Object> get props => [];
}
class ChatParticipantInitial extends ChatParticipantState {}
