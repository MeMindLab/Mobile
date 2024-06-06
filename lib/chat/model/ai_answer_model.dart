import 'package:json_annotation/json_annotation.dart';

part 'ai_answer_model.g.dart';

@JsonSerializable()
class AiAnswerModel {
  final Result result;
  AiAnswerModel({
    required this.result,
  });

  factory AiAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AiAnswerModelFromJson(json);
}

@JsonSerializable()
class Result {
  final String answer;
  Result({
    required this.answer,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
