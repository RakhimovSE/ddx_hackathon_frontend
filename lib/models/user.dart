import 'package:json_annotation/json_annotation.dart';
import 'trainer_profile.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'ID')
  final int id;
  final String name;
  final String email;
  final String? avatarUrl;
  final TrainerProfile? trainerProfile;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.trainerProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
