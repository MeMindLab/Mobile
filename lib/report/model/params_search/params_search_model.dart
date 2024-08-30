import 'package:json_annotation/json_annotation.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';

part 'params_search_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsSearchModel extends ParamsModel {
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
  @override
  Map<String, dynamic> toJson() => _$ParamsSearchModelToJson(this);

  @override
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
