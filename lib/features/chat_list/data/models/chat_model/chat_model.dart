import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../chat_message/chat_message.dart';
import '../../../../chat_participant/chat_participant.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel({
    required int id,
    required int createdBy,
    String? name,
    @JsonKey(name: 'is_private') required bool isPrivate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'last_message') ChatMessage? lastMessage,
    required List<ChatParticipant> participant,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
