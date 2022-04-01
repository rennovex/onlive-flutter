import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/redis_cubit.dart';
import '../cubit/chat_overview_cubit.dart';

import '../../../../injection_container.dart';
import '../../../../widgets/chat_tile.dart';

class ChatOverviewScreen extends StatelessWidget {
  const ChatOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: ,
        body: Container(
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
              ChatAppBar(),
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: BlocBuilder<ChatOverviewCubit, ChatOverviewState>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (_, ind) =>
                              ChatTile(onPressed: () async {
                            context
                                .read<ChatOverviewCubit>()
                                .setSelectedUser(ind + 1);
                            await Navigator.of(context).pushNamed('/chat');
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 140.0),
      //alignment: Alignment.center,

      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  size: 34,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Chats',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                StoryWidget(),
                StoryWidget(),
                StoryWidget(),
                // TextButton(
                //     onPressed: () => Navigator.of(context).pushNamed('/chat'),
                //     child: Text('Next'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Marjorie',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
