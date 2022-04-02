import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entitites/chat.dart';
import '../../domain/usecase/get_chats.dart' as GC;
import '../../domain/usecase/post_chat.dart' as PC;
import '../../../../dummy_data.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final PC.PostChat postChat;
  final GC.GetChats getChats;
  ChatBloc({required this.postChat, required this.getChats})
      : super(
          ChatState(chats: [], sendMessage: '', pageStatus: PageStatus.Initial),
        ) {
    on<SendMessageChanged>(_onSendMessageChanged);
    on<SendMessageClicked>(_onSendMessageClicked);
    on<LoadChat>(_onLoadChat);
  }

  FutureOr<void> _onSendMessageChanged(
      SendMessageChanged event, Emitter<ChatState> emit) {
    emit(state.copyWith(sendMessage: event.sendMessage));
  }

  FutureOr<void> _onSendMessageClicked(
      SendMessageClicked event, Emitter<ChatState> emit) async {
    final Chat chat = Chat(
      from: '$USERID',
      to: '',
      body: state.sendMessage.trim(),
      status: '',
      timeStamp: DateTime.now(),
      id: '',
      v: 1,
    );
    // List<Chat> _chats = state.chats;
    print(state.sendMessage);
    if (state.sendMessage != '') {
      // _chats.add(chat);
      // emit(state.copyWith(pageStatus: PageStatus.Loading));
      emit(state.copyWith(pageStatus: PageStatus.Initial, sendMessage: ''));
      final response =
          await postChat(PC.Params(chat: chat, userId: event.userId));
      response.fold((l) => print(l), (r) => add(LoadChat(1)));
    }
    // emit(state.copyWith(chats: _chats));
  }

  FutureOr<void> _onLoadChat(LoadChat event, Emitter<ChatState> emit) async {
    emit(state.copyWith(pageStatus: PageStatus.Initial));
    List<Chat> chats = [];
    final res = await getChats(GC.Params(userId: event.userId));
    res.fold((exception) => print(exception), (value) => chats = value);
    emit(state.copyWith(chats: chats));
    emit(state.copyWith(pageStatus: PageStatus.Loaded));
  }
}
