import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  @override
  ResultScreen(
      {super.key, required this.setHomeScreen, required this.chosenAnswers});

  final void Function() setHomeScreen;

  List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": question[i].text,
          "correct_answer": question[i].answers[0],
          "user_answer": chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numTotalQuestions = (chosenAnswers.length);
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData.where((data) {
      return (data['user_answer'] == data['correct_answer']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
                style: TextStyle(color: Color.fromARGB(255, 181, 139, 205))),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: setHomeScreen,
              style: TextButton.styleFrom(
                  iconColor: const Color.fromARGB(220, 254, 254, 254),
                  foregroundColor: const Color.fromARGB(220, 255, 255, 255)),
              icon: const Icon(
                Icons.refresh_sharp,
              ),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ResultScreen2 extends StatelessWidget {
  @override
  // ignore: non_constant_identifier_names
  ResultScreen2(
      {super.key, required this.entered_answers, required this.returnHome});

  final void Function() returnHome;

  // ignore: non_constant_identifier_names
  List<String> entered_answers;

  @override
  Widget build(context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Entered Answers: ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...entered_answers.map((item) {
            return //Container(
                //padding: const EdgeInsets.all(20),
                //child:
                Text(
              item,
              style: const TextStyle(color: Color.fromARGB(199, 60, 189, 211)),
              //),
            );
          }),
          OutlinedButton(
            onPressed: returnHome,
            child: const Text(
              "HOME",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
