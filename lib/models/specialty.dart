import 'package:json_annotation/json_annotation.dart';

part 'specialty.g.dart';

@JsonSerializable()
class Specialty {
  @JsonKey(name: 'ID')
  final int id;
  final String name;

  Specialty({
    required this.id,
    required this.name,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialtyToJson(this);
}
