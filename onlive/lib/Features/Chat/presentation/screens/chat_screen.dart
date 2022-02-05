import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wade Warren',
                  style: TextStyle(
                    color: Color.fromRGBO(46, 45, 45, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 51, 51, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChatBubble(isMe: false),
              ChatBubble(isMe: true),
              ChatBubble(isMe: false),
              ChatBubble(isMe: false),
              ChatBubble(isMe: true),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  const ChatBubble({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isMe)
          CircleAvatar(
            radius: 25,
          ),
        Container(
          margin: EdgeInsets.only(
            top: 18,
            left: 5,
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: isMe
                ? Color.fromRGBO(79, 219, 146, 1)
                : Color.fromRGBO(48, 193, 248, 1),
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(20) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(20),
              bottomRight: isMe ? Radius.circular(30) : Radius.circular(20),
              bottomLeft: isMe ? Radius.circular(20) : Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Ask CDCR San Quintin State Priso Purex dispensers throughout the prison to combat diseases…and it was a Roaring ',
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