part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.chats,
    required this.sendMessage,
  });

  final List<Chat> chats;

  final String sendMessage;

  @override
  List<Object> get props => [chats, sendMessage];

  AuthState copyWith({
    List<Chat>? chats,
    String? sendMessage,
  }) {
    return AuthState(
      chats: chats ?? this.chats,
      sendMessage: sendMessage ?? this.sendMessage,
    );
  }
}
