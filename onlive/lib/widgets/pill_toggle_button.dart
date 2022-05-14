import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onlive/Features/Registration/domain/entities/interest.dart';
import 'package:onlive/Features/Registration/presentation/bloc/reguser_bloc.dart';

class PillToggleButton extends StatelessWidget {
  final List<Interest> selectedInterests;
  const PillToggleButton({
    Key? key,
    required this.selectedInterests,
    required this.interest,
  }) : super(key: key);

  final Interest interest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    color: selectedInterests.contains(interest)
                        ? Colors.blue
                        : Colors.black),
              ),
            ),
          ),
          onPressed: () {
            context.read<ReguserBloc>().add(InterestSelected(interest));
          },
          child: Container(
            child: Text(
              interest.name,
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 13,
                  color: selectedInterests.contains(interest)
                      ? Colors.blue
                      : Colors.black),
            ),
          )),
    );
  }
}
