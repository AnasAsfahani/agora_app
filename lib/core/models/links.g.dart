// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
  first: json['first'] as String,
  previous: json['previous'] as String?,
  next: json['next'] as String?,
  last: json['last'] as String,
);

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
  'first': instance.first,
  'previous': instance.previous,
  'next': instance.next,
  'last': instance.last,
};
