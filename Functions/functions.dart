import 'package:quiz_app/Questions/questions.dart';

int questionNumberIndex = 0;
int score = 0;
Map<int, String> UserAnswer = {};
void PreviousQuestion() {
  if (questionNumberIndex > 0) {
    questionNumberIndex--;
  }
}

void RestQuiz() {
  UserAnswer.clear();
  questionNumberIndex = 0;
  score = 0;
}

void GoToNextQuestion() {
  if (questionNumberIndex < questions.length) {
    questionNumberIndex++;
  }
}

void checkAnswer(String answer) {
  UserAnswer[questionNumberIndex] = answer;
  score = 0;
  UserAnswer.forEach((index, selectedAnwer) {
    if (selectedAnwer == questions[index]["correct"]) {
      score++;
    }
  });
}
