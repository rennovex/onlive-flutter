import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../injection_container.dart';
import '../../domain/entitites/chat.dart';
import '../bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => sl<ChatBloc>(),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return SafeArea(
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
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: BlocBuilder<ChatBloc, ChatState>(
                                      builder: (context, state) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state.chats.length,
                                          itemBuilder: (_, index) => ChatBubble(
                                            chat: state.chats[index],
                                          ),
                                        );
                                      },
                                    ),
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
            );
          },
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

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (message) => BlocProvider.of<ChatBloc>(context)
                      .add(SendMessageChanged(sendMessage: message)),
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
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => BlocProvider.of<ChatBloc>(context)
                      .add(SendMessageClicked()),
                  // onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Chat chat;
  const ChatBubble({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          chat.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!chat.isMe)
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
            color: chat.isMe
                ? Color.fromRGBO(79, 219, 146, 1)
                : Color.fromRGBO(48, 193, 248, 1),
            borderRadius: BorderRadius.only(
              topLeft: chat.isMe ? Radius.circular(20) : Radius.circular(0),
              topRight: chat.isMe ? Radius.circular(0) : Radius.circular(20),
              bottomRight:
                  chat.isMe ? Radius.circular(30) : Radius.circular(20),
              bottomLeft: chat.isMe ? Radius.circular(20) : Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    '${chat.message}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '2.33',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
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
