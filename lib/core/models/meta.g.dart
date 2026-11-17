// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  totalItems: (json['totalItems'] as num).toDouble(),
  currentPage: (json['currentPage'] as num).toDouble(),
  itemCount: (json['itemCount'] as num).toDouble(),
  itemsPerPage: (json['itemsPerPage'] as num).toDouble(),
  totalPages: (json['totalPages'] as num).toDouble(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'totalItems': instance.totalItems,
  'currentPage': instance.currentPage,
  'itemCount': instance.itemCount,
  'itemsPerPage': instance.itemsPerPage,
  'totalPages': instance.totalPages,
};
