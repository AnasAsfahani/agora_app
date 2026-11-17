import 'package:json_annotation/json_annotation.dart';

enum OrderingEnum {
  @JsonValue("ASC")
  asc,

  @JsonValue("DES")
  des,
}

extension OrderingEnumX on OrderingEnum {
  String get nameUpper {
    switch (this) {
      case OrderingEnum.asc:
        return "ASC";
      case OrderingEnum.des:
        return "DES";
    }
  }
}
