import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/models/add_question_model.dart';

class AddQuestionsController extends GetxController {
  Rx<List<AddQuestionModel>> questionlist = Rx<List<AddQuestionModel>>([]);
  List<AddQuestionModel> get questionlistupdated => questionlist.value;

  void updateQuestions(String question, String op1, String op2, String op3,
      String op4, String correctop) {
    questionlistupdated.add(AddQuestionModel(
        question: question,
        op1: op1,
        op2: op2,
        op3: op3,
        op4: op4,
        correctOption: correctop));
    update();
    print(questionlistupdated.length);
  }
}
