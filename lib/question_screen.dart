import "package:adv_basics/answerbutton.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter/material.dart";
import "package:adv_basics/data/questions.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  // ignore: non_constant_identifier_names
  int current_quesiton_index = 0;


  void answerQuestion(String item) {

    widget.onSelectAnswer(item);
    setState(() {
      current_quesiton_index++;
    });
  }

  //QuizQuestion current_quesiton=QuizQuestion(text, answers)
  @override
  Widget build(context) {
    final currentQuestion = question[current_quesiton_index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 195, 144, 217),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                text: item,
                onTap: (){
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
