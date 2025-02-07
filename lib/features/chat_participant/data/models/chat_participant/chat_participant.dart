import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/user.dart';

part 'chat_participant.freezed.dart';
part 'chat_participant.g.dart';

@freezed
class ChatParticipant with _$ChatParticipant {
  factory ChatParticipant({
    required int id,
    @JsonKey(name: 'chat_id') required int chatId,
    @JsonKey(name: 'user_id') required int userId,
    required UserModel user,
  }) = _ChatParticipant;

  factory ChatParticipant.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantFromJson(json);
}
