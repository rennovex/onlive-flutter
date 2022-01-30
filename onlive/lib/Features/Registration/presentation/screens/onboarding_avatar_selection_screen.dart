import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/gradient_button.dart';

class OnboardingAvatarSelectionScreen extends StatelessWidget {
  const OnboardingAvatarSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 34.0, top: 20.0, right: 34.0),
              child: Text(
                'Let\'s set your public profile',
                textAlign: TextAlign.start,
                style: kHeaderTextStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 34.0, top: 20.0, right: 34.0),
              child: Text(
                'Let’s now set up your public profile. This is the only data that will be visible to the public',
                style: kParaTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset.fromDirection(1.57, 4),
                      blurRadius: 19,
                    ),
                  ],
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 21.0, left: 32.0),
                    child: Text(
                      'Select an avatar',
                      style: kActionHeaderTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 42,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Center(
                      child: GradientButon(
                    onPressed: () async =>
                        await Navigator.of(context).pushNamed('/onboarding3'),
                    text: 'Next',
                  )),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
