import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlive/Features/Chat/domain/entitites/chat.dart';
import 'package:onlive/Features/Chat/domain/usecase/post_chat.dart';
import 'package:onlive/dummy_data.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final PostChat postChat;
  ChatBloc({required this.postChat})
      : super(
          ChatState(
              chats: chats, sendMessage: '', pageStatus: PageStatus.Loaded),
        ) {
    on<SendMessageChanged>(_onSendMessageChanged);
    on<SendMessageClicked>(_onSendMessageClicked);
  }

  FutureOr<void> _onSendMessageChanged(
      SendMessageChanged event, Emitter<ChatState> emit) {
    emit(state.copyWith(sendMessage: event.sendMessage));
  }

  FutureOr<void> _onSendMessageClicked(
      SendMessageClicked event, Emitter<ChatState> emit) async {
    final Chat chat = Chat(
      isMe: true,
      message: state.sendMessage.trim(),
    );
    List<Chat> _chats = state.chats;
    print(state.sendMessage);
    if (state.sendMessage != '') {
      _chats.add(chat);
      // emit(state.copyWith(pageStatus: PageStatus.Loading));
      postChat(Params(chat: chat));
      emit(state.copyWith(chats: _chats, sendMessage: ''));
      // emit(state.copyWith(pageStatus: PageStatus.NewChatAdded));
      // await Future.delayed(Duration(seconds: 1));
      // emit(state.copyWith(pageStatus: PageStatus.Loaded));
    }
    // emit(state.copyWith(chats: _chats));
  }
}
