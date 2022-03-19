import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Chat/presentation/cubit/redis_cubit.dart';
import 'package:onlive/dummy_data.dart';
import 'package:intl/intl.dart';

import '../cubit/chat_overview_cubit.dart';

import '../../../../constants.dart';
import '../../../../injection_container.dart';
import '../../domain/entitites/chat.dart';
import '../bloc/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;
  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      // appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => sl<ChatBloc>(),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(152, 227, 255, 1),
                  Color.fromRGBO(149, 255, 206, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                // ChatAppBar(),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hamid Raza',
                                style: kActionHeaderTextStyle,
                              ),
                              Text(
                                'Online',
                                style: kParaTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                // bottom:
                                //     MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: BlocBuilder<ChatOverviewCubit,
                                  ChatOverviewState>(
                                builder: (context, userState) {
                                  return BlocBuilder<ChatBloc, ChatState>(
                                      builder: (context, state) {
                                    if (state.pageStatus ==
                                        PageStatus.Initial) {
                                      print(
                                          "selected Chat: ${userState.selectedChat}");
                                      context.read<ChatBloc>().add(
                                          LoadChat(userState.selectedChat));
                                      // print("scrolling");
                                      // _scrollToBottom();
                                    }
                                    // } else
                                    // if (state.pageStatus == PageStatus.Loaded) {
                                    return BlocListener<RedisCubit, RedisState>(
                                      listener: (context, redis_state) {
                                        if (redis_state is RedisNewEvents) {
                                          print('Load Chat event triggered');
                                          context.read<ChatBloc>().add(
                                              LoadChat(userState.selectedChat));
                                        }
                                      },
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: ListView.builder(
                                          controller: _scrollController,
                                          shrinkWrap: true,
                                          reverse: true,
                                          itemCount: state.chats.length,
                                          itemBuilder: (_, index) => ChatBubble(
                                            chat: state.chats.reversed
                                                .toList()[index],
                                            // key: UniqueKey(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                      // return Text('Error');
                                      // },
                                      );
                                },
                              ),
                            ),
                          ),
                          NewMessage(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
          child: Text(
            'Arnold Parge',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
        ),
      ),
      preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
    );
  }
}

class NewMessage extends StatefulWidget {
  const NewMessage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: (message) {
                    context
                        .read<ChatBloc>()
                        .add(SendMessageChanged(sendMessage: message));
                  },
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(227, 227, 227, 1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Type Something...',
                  ),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: kgradientText,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BlocBuilder<ChatOverviewCubit, ChatOverviewState>(
                  builder: (context, overviewState) {
                    return IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<ChatBloc>().add(
                              SendMessageClicked(overviewState.selectedChat));
                          _controller.clear();
                        }
                        // onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
                        );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Chat chat;
  const ChatBubble({
    Key? key,
    required this.chat,
  }) : super(key: key);

  bool isMe(String id) => id == '$USERID';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe(chat.from) ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          isMe(chat.from) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isMe(chat.from))
          CircleAvatar(
            radius: 25,
          ),
        Container(
          margin: EdgeInsets.only(
            top: 18,
            left: 5,
          ),
          // width: MediaQuery.of(context).size.width * 0.7,
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: isMe(chat.from)
                ? Color.fromRGBO(79, 219, 146, 1)
                : Color.fromRGBO(48, 193, 248, 1),
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe(chat.from) ? Radius.circular(20) : Radius.circular(0),
              topRight:
                  isMe(chat.from) ? Radius.circular(0) : Radius.circular(20),
              bottomRight:
                  isMe(chat.from) ? Radius.circular(30) : Radius.circular(20),
              bottomLeft:
                  isMe(chat.from) ? Radius.circular(20) : Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    '${chat.body}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  // '${chat.timeStamp.hour % 12}.${chat.timeStamp.minute}',
                  '${DateFormat.jm().format(chat.timeStamp)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
