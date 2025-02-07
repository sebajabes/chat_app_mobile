import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/user.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  factory ChatMessage({
    required int id,
    @JsonKey(name: 'chat_id') required int chatId,
    @JsonKey(name: 'user_id') required int userId,
    required String message,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required UserModel user,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
