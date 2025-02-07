import '../../../../../core/core.dart';
import '../../../chat_list.dart';

abstract class BaseChatRepository {
  Future<AppResponse<List<ChatModel>>> getChats();

  Future<AppResponse<ChatModel?>> createChat(CreateChatRequest request);

  Future<AppResponse<ChatModel?>> getSingleChat(int chatId);
}
