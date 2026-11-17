import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final double totalItems;
  final double currentPage;
  final double itemCount;
  final double itemsPerPage;
  final double totalPages;

  Meta({
    required this.totalItems,
    required this.currentPage,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
