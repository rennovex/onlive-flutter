import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Registration/presentation/bloc/reguser_bloc.dart';
import 'package:onlive/injection_container.dart';
import '../constants.dart';
import '../widgets/pill_toggle_button.dart';
import '../widgets/profile_icon_button.dart';
import '../widgets/gradient_button.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

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
        body: BlocProvider(
          create: (context) => sl<ReguserBloc>(),
          child: BlocBuilder<ReguserBloc, ReguserState>(
            builder: (context, state) {
              context.read<ReguserBloc>().add(LoadInterests());
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Name Here',
                            hintText: 'Enter Name Here',
                          ),
                          onChanged: (value) => context
                              .read<ReguserBloc>()
                              .add(NicknameChanged(value)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Interests',
                      style: kParaTextStyle,
                    ),
                    Wrap(
                      children: [
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                        PillToggleButton(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: GradientButon(
                        text: "Next",
                        onPressed: () async {
                          print('button pressed');
                          return await Navigator.of(context)
                              .pushNamed('/onboarding2');
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
