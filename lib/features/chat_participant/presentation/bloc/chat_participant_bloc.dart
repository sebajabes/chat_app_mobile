import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_participant_event.dart';
part 'chat_participant_state.dart';

class ChatParticipantBloc
    extends Bloc<ChatParticipantEvent, ChatParticipantState> {
  ChatParticipantBloc() : super(ChatParticipantInitial()) {
    on<ChatParticipantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
