import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reguser_bloc.dart';
import '../../../../Utils/constants/dummy_data.dart';
import '../../../../constants.dart';
import '../../../../widgets/pill_toggle_button.dart';
import '../../../../widgets/profile_icon_button.dart';
import '../../../../widgets/gradient_button.dart';

class OnBoarding_First extends StatelessWidget {
  const OnBoarding_First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton(
            onPressed: () {},
            child: Image.asset('images/arrow_back.png'),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Image.asset('images/questionmarkicon.png'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's set your public ",
                  style: kHeaderTextStyle,
                ),
                Text(
                  "profle ",
                  style: kHeaderTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Let’s now set up your public profile. This is the only data that will be visible to the public",
                  style: kParaTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(child: ProfileIconButton()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'NickName',
                  style: kParaTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                BlocBuilder<ReguserBloc, ReguserState>(
                  builder: (context, state) {
                    return TextField(
                      onChanged: (nickname) => context
                          .read<ReguserBloc>()
                          .add(NicknameChanged(nickname)),
                      decoration: InputDecoration(
                        // label: Text('asdf'),
                        // labelText: 'Nickname'
                        // ,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        isDense: true,
                        border: OutlineInputBorder(),

                        // labelText: 'Enter Name Here',
                        // hintText: 'Enter Name Here',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Interests',
                  style: kParaTextStyle,
                ),
                BlocBuilder<ReguserBloc, ReguserState>(
                  builder: (context, state) {
                    if (state.avatarSelectionPageState == PageStatus.Initial)
                      context.read<ReguserBloc>().add(LoadInterests());
                    if (state.avatarSelectionPageState == PageStatus.Loading)
                      return CircularProgressIndicator();

                    return Wrap(
                      direction: Axis.horizontal,
                      children: state.interests
                          .map((e) => PillToggleButton(
                                selectedInterests: state.selectedInterests,
                                interest: e,
                              ))
                          .toList(),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GradientButon(
                    onPressed: () async {
                      print('next tapped');
                      await Navigator.of(context).pushNamed('/onboarding2');
                    },
                    text: "Next",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
