import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/dummy_data.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
      : super(
          ChatState(chats: chats, sendMessage: ''),
        ) {
    on<SendMessageChanged>(_onSendMessageChanged);
    on<SendMessageClicked>(_onSendMessageClicked);
  }

  FutureOr<void> _onSendMessageChanged(
      SendMessageChanged event, Emitter<ChatState> emit) {
    emit(state.copyWith(sendMessage: event.sendMessage));
  }

  FutureOr<void> _onSendMessageClicked(
      SendMessageClicked event, Emitter<ChatState> emit) {
    final Chat chat = Chat(
      isMe: true,
      message: state.sendMessage,
    );
    state.chats.add(chat);
    print(state.sendMessage);
    emit(state);
  }
}
