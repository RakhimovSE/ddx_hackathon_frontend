import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise {
  @JsonKey(name: 'ID')
  final int id;
  final String name;
  @JsonKey(name: 'type_id')
  final int typeId;
  final ExerciseType type;
  @JsonKey(name: 'difficulty_id')
  final int difficultyId;
  final Difficulty difficulty;
  @JsonKey(name: 'Muscles')
  final List<Muscle> muscles;
  @JsonKey(name: 'AdditionalMuscles')
  final List<Muscle> additionalMuscles;
  @JsonKey(name: 'Equipments')
  final List<Equipment> equipments;
  final List<ExercisePhoto> photos;
  final String unit;
  @JsonKey(name: 'source_type')
  final String sourceType;

  Exercise({
    required this.id,
    required this.name,
    required this.typeId,
    required this.type,
    required this.difficultyId,
    required this.difficulty,
    required this.muscles,
    required this.additionalMuscles,
    required this.equipments,
    required this.photos,
    required this.unit,
    required this.sourceType,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@JsonSerializable()
class ExerciseType {
  @JsonKey(name: 'ID')
  final int id;
  final String name;

  ExerciseType({
    required this.id,
    required this.name,
  });

  factory ExerciseType.fromJson(Map<String, dynamic> json) =>
      _$ExerciseTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseTypeToJson(this);
}

@JsonSerializable()
class Difficulty {
  @JsonKey(name: 'ID')
  final int id;
  final String level;

  Difficulty({
    required this.id,
    required this.level,
  });

  factory Difficulty.fromJson(Map<String, dynamic> json) =>
      _$DifficultyFromJson(json);
  Map<String, dynamic> toJson() => _$DifficultyToJson(this);
}

@JsonSerializable()
class Muscle {
  @JsonKey(name: 'ID')
  final int id;
  final String name;

  Muscle({
    required this.id,
    required this.name,
  });

  factory Muscle.fromJson(Map<String, dynamic> json) => _$MuscleFromJson(json);
  Map<String, dynamic> toJson() => _$MuscleToJson(this);
}

@JsonSerializable()
class Equipment {
  @JsonKey(name: 'ID')
  final int id;
  final String name;

  Equipment({
    required this.id,
    required this.name,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}

@JsonSerializable()
class ExercisePhoto {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'photoUrl')
  final String photoUrl;

  ExercisePhoto({
    required this.id,
    required this.photoUrl,
  });

  factory ExercisePhoto.fromJson(Map<String, dynamic> json) =>
      _$ExercisePhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ExercisePhotoToJson(this);
}
