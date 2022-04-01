import 'package:flutter/material.dart';
import '../bloc/reguser_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../../../constants.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/input_box.dart';

class OnBoarding_Second extends StatelessWidget {
  const OnBoarding_Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
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
                  "Let's get you up and ",
                  style: kHeaderTextStyle,
                ),
                Text(
                  "running! ",
                  style: kHeaderTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "We need know a bit about you to get your account up and running.",
                  style: kParaTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/exclamation-icon.png',
                      scale: 0.75,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'None of this information will  be visible to the public.',
                        style: kAlertTextStyle,
                        // overflow: TextOverflow.fade,
                        maxLines: 2,
                        // softWrap: true,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Full Name',
                  style: kParaTextStyle,
                ),
                InputBox(
                    onchangedFn: (_) => context
                        .read<ReguserBloc>()
                        .add(FullNameChanged(fullName: _))),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Age',
                  style: kParaTextStyle,
                ),
                InputBox(
                  onchangedFn: (_) =>
                      context.read<ReguserBloc>().add(AgeChanged(age: _)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Email',
                  style: kParaTextStyle,
                ),
                InputBox(
                  onchangedFn: (_) => context
                      .read<ReguserBloc>()
                      .add(FullNameChanged(fullName: _)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Gender',
                  style: kParaTextStyle,
                ),
                InputBox(
                  onchangedFn: (_) => context
                      .read<ReguserBloc>()
                      .add(FullNameChanged(fullName: _)),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GradientButon(
                    text: "Next",
                    onPressed: () {},
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
