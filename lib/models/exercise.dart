import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise {
  final int id;
  final String name;
  final String muscle;
  final String additionalMuscle;
  final String type;
  final String equipment;
  final String difficulty;
  final List<ExercisePhoto> photos;

  Exercise({
    required this.id,
    required this.name,
    required this.muscle,
    required this.additionalMuscle,
    required this.type,
    required this.equipment,
    required this.difficulty,
    required this.photos,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@JsonSerializable()
class ExercisePhoto {
  final int id;
  final String photoUrl;

  ExercisePhoto({
    required this.id,
    required this.photoUrl,
  });

  factory ExercisePhoto.fromJson(Map<String, dynamic> json) =>
      _$ExercisePhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ExercisePhotoToJson(this);
}
