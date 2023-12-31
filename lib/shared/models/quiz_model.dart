// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionAnswered = 0,
      required this.imagem,
      required this.level});

  get completed =>
      this.questionAnswered.toString() + "/" + this.questions.length.toString();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse
    };
  }

factory QuizModel.fromMap(Map<String, dynamic> map) {
  return QuizModel(
    title: map['title'],
    questions: List<QuestionModel>.from(
        map['questions']?.map((x) => QuestionModel.fromMap(x))),
    questionAnswered: map['questionAnswered'],
    imagem: map['imagem'],
    level: (map['level'] != null) ? map['level'].toString().parse : Level.facil,
  );
}


  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
