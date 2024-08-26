import 'package:json_annotation/json_annotation.dart';

part 'params_month_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsMonthModel {
  final int year;
  final int month;
  final int? limit;
  final String? cursor;
  ParamsMonthModel({
    required this.year,
    required this.month,
    this.limit,
    this.cursor,
  });

  factory ParamsMonthModel.fromJson(Map<String, dynamic> json) =>
      _$ParamsMonthModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsMonthModelToJson(this);

  ParamsMonthModel copyWith({
    int? year,
    int? month,
    int? limit,
    String? cursor,
  }) {
    return ParamsMonthModel(
      year: year ?? this.year,
      month: month ?? this.month,
      limit: limit ?? this.limit,
      cursor: cursor ?? this.cursor,
    );
  }
}
