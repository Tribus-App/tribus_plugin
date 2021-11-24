import 'answer_entity.dart';

class QuizEntity {
  List<AnswerEntity> answers;
  num totalScore;

  QuizEntity({
    required this.answers,
    required this.totalScore,
  });
}
