// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      modified: json['modified'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      resourceURI: json['resourceURI'] as String?,
      series: json['series'] == null
          ? null
          : Series.fromJson(json['series'] as Map<String, dynamic>),
    );
