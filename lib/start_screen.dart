import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          /*Opacity(
            opacity: 0.25,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
            ),
          ),
          */
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.bebasNeue(
              color: Color.fromARGB(255, 208, 137, 241),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              //shadowColor: Color.fromARGB(255, 67, 22, 125),
              foregroundColor: Colors.white,
              side:
              const BorderSide(color: Color.fromARGB(255, 62, 20, 113)),
            ),
            icon: const Icon(
              Icons.arrow_right_alt
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
