class QuizQuestion{
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  String getQuestion(){
    return text;
  }
  List<String> getAnswers(){
    return answers;
  }

  List<String> getShuffledAnswers(){
    final shuffeldList=List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }

}