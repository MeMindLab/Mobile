import 'package:json_annotation/json_annotation.dart';

part 'create_daily_model.g.dart';

@JsonSerializable()
class CreateDailyModel {
  @JsonKey(name: "report_id")
  final String reportId;
  final List<String> keyword;
  CreateDailyModel({
    required this.reportId,
    required this.keyword,
  });

  factory CreateDailyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDailyModelFromJson(json);
}
