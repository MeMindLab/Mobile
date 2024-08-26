// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsMonthModel _$ParamsMonthModelFromJson(Map<String, dynamic> json) =>
    ParamsMonthModel(
      year: json['year'] as int,
      month: json['month'] as int,
      limit: json['limit'] as int?,
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$ParamsMonthModelToJson(ParamsMonthModel instance) {
  final val = <String, dynamic>{
    'year': instance.year,
    'month': instance.month,
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
