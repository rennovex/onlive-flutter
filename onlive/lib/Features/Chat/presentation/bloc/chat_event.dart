part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageChanged extends ChatEvent {
  final String sendMessage;
  SendMessageChanged({
    required this.sendMessage,
  });

  @override
  List<Object> get props => [sendMessage];
}

class SendMessageClicked extends ChatEvent {
  final int userId;

  SendMessageClicked(this.userId);
  @override
  List<Object> get props => [userId];
}

class LoadChat extends ChatEvent {
  final int userId;

  LoadChat(this.userId);
  @override
  List<Object> get props => [userId];
}
