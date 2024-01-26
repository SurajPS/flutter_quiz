import "package:adv_basics/question_screen.dart";
import 'package:adv_basics/result_screen.dart';
import "package:adv_basics/start_screen.dart";
import "package:flutter/material.dart";
import 'package:adv_basics/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{

  var activeScreen="start-screen";
  List<String> selectedAnswers=[];

  switchScreen(){
    setState(() {
      selectedAnswers=[];  
      activeScreen = "questions-screen";
    });
  }

  setHomeScreen(){
    setState(() {
      activeScreen = "start-screen";
      print("GOHOME");
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length>=question.length){
      setState(() {
      activeScreen = "result-screen";      
      });
    }

  }

  @override
  Widget build(context) {
    //Widget screenWidget = activeScreen=="start-screen" ? StartScreen(switchScreen) : const QuestionScreen();
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == "questions-screen"){
      screenWidget = QuestionScreen(onSelectAnswer:chooseAnswer);
    }
    else if(activeScreen == "result-screen"){
      //TO BE CHANGED
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,setHomeScreen: setHomeScreen,);
    }
    else if(activeScreen == "start-screen"){
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 35, 2, 50),
              Color.fromARGB(255, 43, 5, 63),
              Color.fromARGB(255, 71, 11, 103),
              Color.fromARGB(255, 76, 12, 111)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }

}
