// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      hasNext: json['has_next'] as bool,
      hasPrev: json['has_prev'] as bool,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'total_count': instance.totalCount,
      'limit': instance.limit,
      'has_next': instance.hasNext,
      'has_prev': instance.hasPrev,
    };
