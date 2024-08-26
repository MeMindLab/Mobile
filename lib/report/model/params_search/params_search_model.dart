import 'package:json_annotation/json_annotation.dart';

part 'params_search_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsSearchModel {
  final String keywords;
  final int? limit;
  final String? cursor;
  ParamsSearchModel({
    required this.keywords,
    this.limit,
    this.cursor,
  });

  factory ParamsSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ParamsSearchModelFromJson(json);

  ParamsSearchModel copyWith({
    String? keywords,
    int? limit,
    String? cursor,
  }) {
    return ParamsSearchModel(
      keywords: keywords ?? this.keywords,
      limit: limit ?? this.limit,
      cursor: cursor ?? this.cursor,
    );
  }
}
