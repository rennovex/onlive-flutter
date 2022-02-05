import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/chat_tile.dart';
import 'package:onlive/widgets/profile_icon_button.dart';
import 'package:onlive/widgets/bottom_navigation_bar.dart';

class ChatOverviewScreen extends StatelessWidget {
  const ChatOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 140.0),
              //alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: kbuttonGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                ),
                boxShadow: [
                  kLoginButtonBoxShadow,
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('images/search_icon.png'),
                        Text(
                          'Chats',
                          style: kSubHeaderTextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ChatTile(),
            ChatTile(),
            ChatTile(),
            ChatTile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/chats_icon.png'),
              
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/groups_icon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/questions_icon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/settings_icon.png'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
