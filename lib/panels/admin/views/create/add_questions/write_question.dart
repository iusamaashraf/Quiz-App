import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/controllers/add_questions_controller.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

class WriteQuestionsPage extends StatelessWidget {
  WriteQuestionsPage({Key? key}) : super(key: key);

  final TextEditingController questionController = TextEditingController();
  final TextEditingController op1Controller = TextEditingController();
  final TextEditingController op2Controller = TextEditingController();
  final TextEditingController op3Controller = TextEditingController();
  final TextEditingController op4Controller = TextEditingController();
  final TextEditingController correctOptionController = TextEditingController();
  final AddQuestionsController controller = Get.put(AddQuestionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                MyInputField(
                  controller: questionController,
                  hint: 'Add Question',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: op1Controller,
                  hint: 'Option 1',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: op2Controller,
                  hint: 'Option 2',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: op3Controller,
                  hint: 'Option 3',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: op4Controller,
                  hint: 'Option 4',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                const Divider(color: Colors.black),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: correctOptionController,
                  hint: 'Correct Option',
                  textInputType: TextInputType.name,
                  validator: (val) {},
                ),
                const Spacer(),
                Row(
                  children: [
                    PrimaryButton(
                      onTap: () {
                        Get.back();
                      },
                      text: 'Done',
                    ),
                    SizedBox(width: 4 * SizeConfig.widthMultiplier),
                    PrimaryButton(
                      onTap: () {
                        controller.updateQuestions(
                            questionController.text,
                            op1Controller.text,
                            op2Controller.text,
                            op3Controller.text,
                            op4Controller.text,
                            correctOptionController.text);
                        //Here we clear when add that mcq
                        questionController.clear();
                        op1Controller.clear();
                        op2Controller.clear();
                        op3Controller.clear();
                        op4Controller.clear();
                        correctOptionController.clear();
                      },
                      text: 'Add',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
