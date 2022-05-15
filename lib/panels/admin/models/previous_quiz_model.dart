class PreviousQuestionsModel {
  final String question;
  final String op1;
  final String op2;
  final String op3;
  final String op4;
  final String correctOption;

  PreviousQuestionsModel({
    required this.question,
    required this.op1,
    required this.op2,
    required this.op3,
    required this.op4,
    required this.correctOption,
  });
}

List<PreviousQuestionsModel> previousQuizList = [
  PreviousQuestionsModel(
    question: 'Who is bilal?',
    op1: 'Male',
    op2: 'Female',
    op3: 'Transgender',
    op4: 'Other',
    correctOption: 'Other',
  ),
  PreviousQuestionsModel(
    question: 'What is you _______',
    op1: 'Name',
    op2: 'Ball',
    op3: 'Cat',
    op4: 'Zoo',
    correctOption: 'Name',
  ),
  PreviousQuestionsModel(
    question: 'Who is bilal?',
    op1: 'Male',
    op2: 'Female',
    op3: 'Transgender',
    op4: 'Other',
    correctOption: 'Other',
  ),
  PreviousQuestionsModel(
    question: 'What is you _______',
    op1: 'Name',
    op2: 'Ball',
    op3: 'Cat',
    op4: 'Zoo',
    correctOption: 'Name',
  ),
  PreviousQuestionsModel(
    question: 'Who is bilal?',
    op1: 'Male',
    op2: 'Female',
    op3: 'Transgender',
    op4: 'Other',
    correctOption: 'Other',
  ),
  PreviousQuestionsModel(
    question: 'What is you _______',
    op1: 'Name',
    op2: 'Ball',
    op3: 'Cat',
    op4: 'Zoo',
    correctOption: 'Name',
  ),
];
