import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Registration/presentation/bloc/reguser_bloc.dart';
import 'package:onlive/Utils/constants/enum.dart';
import '../../../../constants.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/thick_gradient_card.dart';

class OnBoarding_Third extends StatelessWidget {
  const OnBoarding_Third({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You're almost set!",
                style: kHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "what would you like to do on onlive?",
                style: kSubHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              ThickGradientCard(
                img: 'images/card_illustration1.png',
                onPressed: () {
                  context
                      .read<ReguserBloc>()
                      .add(DomainSelected(Domain.Campus));
                  Navigator.of(context).pushNamed('/onboarding5');
                },
                text: 'Onlive Campus',
                para:
                    'Interact wity your own campus mates. Who knows who your next anynomous buddy will be?',
              ),
              SizedBox(
                height: 30,
              ),
              ThickGradientCard(
                img: 'images/card_illustration2.png',
                onPressed: () {
                  context
                      .read<ReguserBloc>()
                      .add(DomainSelected(Domain.Public));
                  Navigator.of(context).pushNamed('/onboarding5');
                },
                text: 'Onlive Public',
                para:
                    'Interact with anyone in the world. Make friends with different cultures and backgrounds',
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Once you select your domain, there’s no going back.',
                  style: kAlertTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
