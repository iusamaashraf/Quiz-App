import 'package:flutter/material.dart';
import 'package:quiz_app/auth/login/login_screen.dart';
import 'package:quiz_app/panels/user/models/question_model.dart';
import 'package:quiz_app/utils/size_config.dart';

// ignore: must_be_immutable
class StudentAttemptPage extends StatefulWidget {
  const StudentAttemptPage({Key? key}) : super(key: key);

  @override
  State<StudentAttemptPage> createState() => _StudentAttemptPageState();
}

class _StudentAttemptPageState extends State<StudentAttemptPage> {
  List<int> groupValue = [];
  // List<int>value = [];
  @override
  void initState() {
    super.initState();
    groupValue = List.filled(questionsList.length, -1);
  }

  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _indexNumber = 0;
  void nextQuestion() {
    if (_indexNumber < questionsList.length) {
      setState(() {
        _indexNumber++;
      });
    }
  }

  // int index = 0;
  // increment() {
  //   questionsList[index] = questionsList[index] + 1;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: questionsList.length,
                  onPageChanged: (page) {},
                  itemBuilder: (BuildContext context, int index) {
                    print(groupValue[index]);
                    return Column(
                      children: [
                        Text(
                          questionsList[index].question,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black),
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: groupValue[index],
                                onChanged: (value) {
                                  setState(() {
                                    groupValue[index] = value as int;
                                  });
                                }),
                            Text(
                              questionsList[index].op1,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: groupValue[index],
                                onChanged: (value) {
                                  setState(() {
                                    groupValue[index] = value as int;
                                  });
                                }),
                            Text(
                              questionsList[index].op2,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 3,
                                groupValue: groupValue[index],
                                onChanged: (value) {
                                  setState(() {
                                    groupValue[index] = value as int;
                                  });
                                }),
                            Text(
                              questionsList[index].op3,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 4,
                                groupValue: groupValue[index],
                                onChanged: (value) {
                                  setState(() {
                                    groupValue[index] = value as int;
                                  });
                                }),
                            Text(
                              questionsList[index].op4,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                index++;
                              });
                              _controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              print(index);
                              //if (index < questionsList.length) {

                              //}
                              //  nextQuestion();
                              // index = questionsList[index].question.length;
                              // index = index + 1;
                              print("The index is:$index");
                            },
                            child: Text('Next Question')
                            // index + 1 == questionsList[index].question.length
                            //     ? 'See Result'
                            //     : 'Next Question'),
                            )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
