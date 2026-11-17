import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  final String first;
  final String? previous;
  final String? next;
  final String last;

  Links({required this.first, this.previous, this.next, required this.last});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
