import 'package:json_annotation/json_annotation.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';

part 'params_month_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsMonthModel extends ParamsModel {
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

  @override
  Map<String, dynamic> toJson() => _$ParamsMonthModelToJson(this);

  @override
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
