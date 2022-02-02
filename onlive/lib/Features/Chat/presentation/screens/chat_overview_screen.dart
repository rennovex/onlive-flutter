import 'package:flutter/material.dart';

class ChatOverviewScreen extends StatelessWidget {
  const ChatOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(
        'Wade Warren',
        style: TextStyle(
          color: Color.fromRGBO(52, 51, 51, 1),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        'Hey there whats going asdfkns sdfks dfsdf sdfsfsdfs fsdfmsdfsdf sdfgl; dsfg dfg',
        style: TextStyle(
          color: Color.fromRGBO(96, 94, 94, 1),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        maxLines: 1,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '2.33pm',
            style: TextStyle(
              color: Color.fromRGBO(96, 94, 94, 1),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Container(
            width: 30,
            height: 17,
            decoration: BoxDecoration(
              color: Color.fromRGBO(48, 193, 248, 1),
              borderRadius: BorderRadius.circular(
                19,
              ),
            ),
            child: Center(
                child: Text(
              '1',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
      isThreeLine: false,
    );
  }
}
