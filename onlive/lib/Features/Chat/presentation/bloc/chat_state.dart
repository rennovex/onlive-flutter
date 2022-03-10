part of 'chat_bloc.dart';

enum PageStatus { Initial, Loading, Loaded, Error, NewChatAdded }

class ChatState extends Equatable {
  ChatState({
    required this.chats,
    required this.pageStatus,
    required this.sendMessage,
  });

  List<Chat> chats;
  PageStatus pageStatus;
  String sendMessage;

  @override
  List<Object> get props => [chats, sendMessage, pageStatus];

  ChatState copyWith({
    List<Chat>? chats,
    PageStatus? pageStatus,
    String? sendMessage,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      pageStatus: pageStatus ?? this.pageStatus,
      sendMessage: sendMessage ?? this.sendMessage,
    );
  }
}
