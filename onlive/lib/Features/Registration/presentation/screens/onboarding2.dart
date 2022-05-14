import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import 'package:onlive/Utils/constants/enum.dart';

import '../../../../constants.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/input_box.dart';
import '../bloc/reguser_bloc.dart';

class OnBoarding_Second extends StatelessWidget {
  const OnBoarding_Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
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
                  // Text(
                  //   'Email',
                  //   style: kParaTextStyle,
                  // ),
                  // InputBox(
                  //   onchangedFn: (_) => context
                  //       .read<ReguserBloc>()
                  //       .add(FullNameChanged(fullName: _)),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Gender',
                    style: kParaTextStyle,
                  ),
                  GestureDetector(
                    onTap: (() => showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              height: 240,
                              // color: Colors.amber,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Select your gender',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GradientOutlinedButton(gender: Gender.Male),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GradientOutlinedButton(
                                        gender: Gender.Female),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GradientOutlinedButton(
                                        gender: Gender.LGBTQ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<ReguserBloc, ReguserState>(
                            builder: (context, state) {
                              return Text(
                                state.gender.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GradientButon(
                        text: "Next",
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/onboarding4')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientOutlinedButton extends StatelessWidget {
  final Gender gender;

  const GradientOutlinedButton({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ReguserBloc>().add(
              GenderChanged(gender: gender),
            );
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 183, 252, 1),
              Color.fromRGBO(55, 217, 142, 1)
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              gender.name,
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
