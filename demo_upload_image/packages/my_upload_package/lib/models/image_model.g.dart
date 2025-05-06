// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => _ImageModel(
      path: json['path'] as String,
      date: (json['date'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ImageModelToJson(_ImageModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'date': instance.date,
      'size': instance.size,
      'lat': instance.lat,
      'long': instance.long,
    };
