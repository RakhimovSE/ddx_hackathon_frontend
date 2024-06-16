import 'package:json_annotation/json_annotation.dart';
import 'specialty.dart';

part 'trainer_profile.g.dart';

@JsonSerializable()
class TrainerProfile {
  final List<Specialty> specialties;
  final int experience;
  final String bio;

  TrainerProfile({
    required this.specialties,
    required this.experience,
    required this.bio,
  });

  factory TrainerProfile.fromJson(Map<String, dynamic> json) =>
      _$TrainerProfileFromJson(json);
  Map<String, dynamic> toJson() => _$TrainerProfileToJson(this);
}
