import 'package:flutter/material.dart';
import 'package:quiz_app/Functions/functions.dart';
import 'package:quiz_app/Questions/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // بيشيل الشريط اللي على اليمين فوق
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: questionNumberIndex < questions.length
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 21, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  235,
                                  224,
                                  246,
                                ),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  PreviousQuestion();
                                });
                              },
                              child: Transform.translate(
                                offset: Offset(-9, 0),
                                child: Icon(Icons.arrow_back_ios, size: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 2),
                            child: Text(
                              "Previous Question",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight(630),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: (questionNumberIndex + 1) / questions.length,

                          minHeight: 4,

                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF8B3DFF),
                          ),

                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 38, right: 217),
                      child: Text(
                        "Question ${questionNumberIndex + 1} of ${questions.length} ",
                        style: TextStyle(
                          fontSize: 19,
                          color: const Color.fromARGB(255, 80, 14, 160),
                          fontWeight: FontWeight(450),
                        ),
                      ),
                    ),

                    //Padding(
                    // padding: const EdgeInsets.only(bottom:1),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 27,
                              bottom: 20,
                            ),
                            child: Text(
                              questions[questionNumberIndex]["question"],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight(500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //),

                    //const SizedBox(height: 20),
                    ...questions[questionNumberIndex]["answers"].map((answer) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 380,
                            height: 76,

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      UserAnswer[questionNumberIndex] == answer
                                      ? const Color(0xFFF1E8FF)
                                      : Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color:
                                          UserAnswer[questionNumberIndex] ==
                                              answer
                                          ? const Color(0xFF8B3DFF)
                                          : Colors.grey.shade300,
                                      width: 1.2,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    checkAnswer(answer);
                                  });
                                },

                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    answer,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                        bottom: 30,
                      ),
                      child: SizedBox(
                        width: 360,
                        height: 57,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              GoToNextQuestion();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight(435),
                                  fontSize: 19,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        "Quiz Finished!",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight(700),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                          left: 2,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Your Score",

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight(600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 1),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 63,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "$score",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    118,
                                    28,
                                    228,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "/${questions.length}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                          left: 10,
                          right: 10,
                        ),
                        child: SizedBox(
                          height: 57,
                          width: 360,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                RestQuiz();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Rest Quiz",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight(435),
                              ),
                            ),
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
