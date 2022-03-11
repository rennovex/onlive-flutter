part of 'chat_overview_cubit.dart';

class ChatOverviewState extends Equatable {
  int selectedChat;

  ChatOverviewState(this.selectedChat);

  @override
  List<Object> get props => [selectedChat];
}
