import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/models/previous_quiz_model.dart';
import 'package:quiz_app/panels/admin/views/create/add_questions/write_question.dart';
import 'package:quiz_app/panels/admin/views/send_quiz/send_quiz.dart';
import 'package:quiz_app/utils/size_config.dart';

// ignore: must_be_immutable
class PreviousQuiz extends StatefulWidget {
  const PreviousQuiz({Key? key}) : super(key: key);

  @override
  State<PreviousQuiz> createState() => _PreviousQuizState();
}

class _PreviousQuizState extends State<PreviousQuiz> {
  bool isSend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: () {
          Get.to(() => WriteQuestionsPage());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Previous Quiz',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                isSend
                    ? Get.to(() => const SendQuizPage())
                    : Get.snackbar('Select Atleast one',
                        'Please select atleast one checkbox');
              },
              child: const Text('Generate')),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 3 * SizeConfig.heightMultiplier),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: previousQuizList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                        width: 90 * SizeConfig.widthMultiplier,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 8),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(previousQuizList[index].question),
                                  Checkbox(
                                      // tristate: true,
                                      value: isSend,
                                      onChanged: (value) {
                                        setState(() {
                                          isSend = value!;
                                        });
                                      }),
                                ],
                              ),
                              Text(previousQuizList[index].op1),
                              Text(previousQuizList[index].op2),
                              Text(previousQuizList[index].op3),
                              Text(previousQuizList[index].op4),
                              const Divider(color: Colors.black),
                              Text("Correct Option is:  " +
                                  previousQuizList[index].correctOption),
                            ],
                          ),
                        ))
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
