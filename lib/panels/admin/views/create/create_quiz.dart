import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/controllers/cateogry_controller.dart';
import 'package:quiz_app/panels/admin/views/create/add_questions/add_questions_page.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

// ignore: must_be_immutable
class CreateQuiz extends StatelessWidget {
  CreateQuiz({Key? key}) : super(key: key);

  CategoryController controller = Get.put(CategoryController());
  final TextEditingController categoryController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void inputValidation() {
    if (_formKey.currentState!.validate()) {
      'Required';
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    categoryController.clear();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation,
                    Animation secondaryAnimation) {
                  return Scaffold(
                    backgroundColor: Colors.transparent.withOpacity(0.3),
                    body: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        width: SizeConfig.widthMultiplier * 80,
                        height: SizeConfig.heightMultiplier * 40,
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Add New Category',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.black)),
                              SizedBox(
                                  height: SizeConfig.heightMultiplier * 1.2),
                              SizedBox(
                                  height: SizeConfig.heightMultiplier * 1.2),
                              MyInputField(
                                hint: 'Enter the category Name',
                                textInputType: TextInputType.name,
                                controller: categoryController,
                                validator: (value) {
                                  // ignore: unnecessary_null_comparison
                                  if (value!.isEmpty || value == null) {
                                    return 'required';
                                  }
                                  return '';
                                },
                              ),
                              SizedBox(
                                  height: SizeConfig.heightMultiplier * 1.2),
                              PrimaryButton(
                                  onTap: () {
                                    inputValidation();
                                    controller.updateCategory(
                                        categoryController.text);
                                    // Get.back();
                                  },
                                  text: 'Add'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add, color: Colors.white)),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.categorylist.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(controller.categorylist.value[index].cateogry);
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => AddQuestionsPage(
                              getCategory:
                                  controller.categoryupdatedlist[index]));
                        },
                        child: Container(
                          height: 8 * SizeConfig.heightMultiplier,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                                controller.categorylist.value[index].cateogry
                                    .toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
