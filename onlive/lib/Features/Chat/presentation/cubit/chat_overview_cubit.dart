import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_overview_state.dart';

class ChatOverviewCubit extends Cubit<ChatOverviewState> {
  ChatOverviewCubit() : super(ChatOverviewState(''));

  Future<void> setSelectedUser(String userId) async {
    emit(ChatOverviewState(userId));
  }
}
