// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsSearchModel _$ParamsSearchModelFromJson(Map<String, dynamic> json) =>
    ParamsSearchModel(
      keywords: json['keywords'] as String,
      limit: json['limit'] as int?,
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$ParamsSearchModelToJson(ParamsSearchModel instance) {
  final val = <String, dynamic>{
    'keywords': instance.keywords,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('cursor', instance.cursor);
  return val;
}
