part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    required this.chats,
    required this.sendMessage,
  });

  final List<Chat> chats;

  final String sendMessage;

  @override
  List<Object> get props => [chats, sendMessage];

  ChatState copyWith({
    List<Chat>? chats,
    String? sendMessage,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      sendMessage: sendMessage ?? this.sendMessage,
    );
  }
}
