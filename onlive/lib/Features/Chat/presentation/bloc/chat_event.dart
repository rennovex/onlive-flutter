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
  @override
  List<Object> get props => [];
}
