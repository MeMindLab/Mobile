import 'package:json_annotation/json_annotation.dart';

part 'report_param_model.g.dart';

@JsonSerializable()
class ReportParamModel {
  final int? year;
  final int? month;
  ReportParamModel({
    this.year,
    this.month,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportParamModel &&
        other.year == year &&
        other.month == month;
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode;
}