import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../widgets/gradient_button.dart';
import '../../../../widgets/input_box.dart';
import '../../../../widgets/thick_gradient_card.dart';
import '../bloc/reguser_bloc.dart';

class OnBoardingCollegeSelection extends StatelessWidget {
  const OnBoardingCollegeSelection({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Padding(
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
                  "Select your campus",
                  style: kSubHeaderTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color.fromRGBO(227, 227, 227, 1),
                    filled: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      // color: Color.fromRGBO(139, 139, 139, 1),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: Color.fromRGBO(139, 139, 139, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: BlocBuilder<ReguserBloc, ReguserState>(
                    builder: (context, state) {
                      if (state.collegeSelectionPageState == PageStatus.Initial)
                        context.read<ReguserBloc>().add(LoadCampuses());
                      else if (state.collegeSelectionPageState ==
                          PageStatus.Loading)
                        return CircularProgressIndicator();
                      return ListView.builder(
                          itemCount: state.campuses.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  context.read<ReguserBloc>().add(
                                      CampusSelected(state.campuses[index]));
                                  print('state: ' + state.college.name);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: state.college ==
                                            state.campuses[index]
                                        ? LinearGradient(colors: [
                                            Color.fromRGBO(197, 239, 255, 1),
                                            Color.fromRGBO(208, 255, 233, 1)
                                          ])
                                        : null,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(227, 227, 227, 1),
                                    ),
                                  ),
                                  child: Text(
                                    state.campuses[index].name,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(121, 121, 121, 1),
                                    ),
                                  ),
                                ),
                              ));
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GradientButon(
                    onPressed: () =>
                        context.read<ReguserBloc>().add(RegistrationComplete()),
                    // Navigator.of(context).pushNamed('/onboarding6'),
                    text: "Lets Gooo!",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'College selection cannot be undone',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color.fromRGBO(131, 131, 131, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
