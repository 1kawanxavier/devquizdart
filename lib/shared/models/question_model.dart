// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:DevQuiz/shared/models/awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;
  
  QuestionModel({required this.title, required this.awnsers}):assert(awnsers.length == 4);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic>? map) {
  if (map == null) {
    throw FormatException("Map cannot be null");
  }

  final title = map['title'] as String?;
  final awnsersList = map['awnsers'] as List<dynamic>?;

  if (title == null || awnsersList == null) {
    throw FormatException("Title and awnsers must not be null");
  }

  final awnsers = List<AwnserModel>.from(
    awnsersList.map<AwnserModel>((x) {
      if (x is Map<String, dynamic>) {
        return AwnserModel.fromMap(x);
      } else {
        throw FormatException("Invalid awnser format");
      }
    }),
  );

  if (awnsers.length != 4) {
    throw FormatException("Awnsers list must have exactly 4 elements");
  }

  return QuestionModel(
    title: title,
    awnsers: awnsers,
  );
}


  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
