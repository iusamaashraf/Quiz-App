import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/controllers/add_questions_controller.dart';
import 'package:quiz_app/panels/admin/models/category_model.dart';
import 'package:quiz_app/panels/admin/views/send_quiz/send_quiz.dart';
import 'package:quiz_app/utils/size_config.dart';

import 'write_question.dart';

class AddQuestionsPage extends StatefulWidget {
  const AddQuestionsPage({
    Key? key,
    required this.getCategory,
  }) : super(key: key);
  final Category getCategory;

  @override
  State<AddQuestionsPage> createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {
  final AddQuestionsController _controller = Get.put(AddQuestionsController());
  bool isSend = false;
  // List<bool>? isSend;

  // @override
  // void initState() {
  //   super.initState();
  //   // isSend = List<bool>.filled(_controller.questionlistupdated.length, false);
  //   // isSend =
  //   // List.generate(_controller.questionlistupdated.length, (index) => false);
  // }

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
          'You choose ${widget.getCategory.cateogry.toUpperCase()}',
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
                    ? Get.to(() => SendQuizPage())
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
              child: GetX<AddQuestionsController>(
                init: _controller,
                builder: (_controller) {
                  return ListView.builder(
                    itemCount: _controller.questionlistupdated.length,
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
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 8),
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
                                        Text(_controller
                                            .questionlistupdated[index]
                                            .question),
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
                                    Text(_controller
                                        .questionlistupdated[index].op1),
                                    Text(_controller
                                        .questionlistupdated[index].op2),
                                    Text(_controller
                                        .questionlistupdated[index].op3),
                                    Text(_controller
                                        .questionlistupdated[index].op4),
                                    const Divider(color: Colors.black),
                                    Text("Correct Option is:  " +
                                        _controller.questionlistupdated[index]
                                            .correctOption),
                                  ],
                                ),
                              ))
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
