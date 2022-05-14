import 'package:flutter/material.dart';
import 'package:onlive/Features/Questions/Presentation/screens/questions_response.dart';

import '../../../../widgets/gradient_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBar: QuestionAppBar(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(248, 248, 248, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ask new question',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ask away',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      // onChanged
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GradientButon(
                      onPressed: () async {},
                      text: "Post",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  QuestionItem(),
                  QuestionItem(),
                  QuestionItem(),
                  QuestionItem(),
                  QuestionItem(),
                  QuestionItem(),
                  QuestionItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionAppBar extends StatelessWidget {
  const QuestionAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // constraints: BoxConstraints(minHeight: 140.0),
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
                  'Onlive Questions',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(226, 247, 255, 1),
            Color.fromRGBO(233, 255, 245, 1),
          ],
          transform: GradientRotation(3.14 / 2),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  'What do you guys think about my new hairstyle?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share_outlined),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '13 responses',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                '02 May 2021',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
