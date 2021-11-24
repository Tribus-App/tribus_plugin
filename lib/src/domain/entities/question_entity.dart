import 'answer_entity.dart';

class QuestionEntity {
  String question;
  List<AnswerEntity> answers;
  num score;
  
  QuestionEntity({
    required this.question,
    required this.answers,
    required this.score,
  });
}
