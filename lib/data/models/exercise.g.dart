// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
      typeId: (json['type_id'] as num).toInt(),
      type: ExerciseType.fromJson(json['type'] as Map<String, dynamic>),
      difficultyId: (json['difficulty_id'] as num).toInt(),
      difficulty:
          Difficulty.fromJson(json['difficulty'] as Map<String, dynamic>),
      muscles: (json['Muscles'] as List<dynamic>)
          .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalMuscles: (json['AdditionalMuscles'] as List<dynamic>)
          .map((e) => Muscle.fromJson(e as Map<String, dynamic>))
          .toList(),
      equipments: (json['Equipments'] as List<dynamic>)
          .map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => ExercisePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['unit'] as String,
      sourceType: json['source_type'] as String,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
      'type_id': instance.typeId,
      'type': instance.type.toJson(),
      'difficulty_id': instance.difficultyId,
      'difficulty': instance.difficulty.toJson(),
      'Muscles': instance.muscles.map((e) => e.toJson()).toList(),
      'AdditionalMuscles':
          instance.additionalMuscles.map((e) => e.toJson()).toList(),
      'Equipments': instance.equipments.map((e) => e.toJson()).toList(),
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      'unit': instance.unit,
      'source_type': instance.sourceType,
    };

ExerciseType _$ExerciseTypeFromJson(Map<String, dynamic> json) => ExerciseType(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ExerciseTypeToJson(ExerciseType instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
    };

Difficulty _$DifficultyFromJson(Map<String, dynamic> json) => Difficulty(
      id: (json['ID'] as num).toInt(),
      level: json['level'] as String,
    );

Map<String, dynamic> _$DifficultyToJson(Difficulty instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'level': instance.level,
    };

Muscle _$MuscleFromJson(Map<String, dynamic> json) => Muscle(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MuscleToJson(Muscle instance) => <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
    };

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
    };

ExercisePhoto _$ExercisePhotoFromJson(Map<String, dynamic> json) =>
    ExercisePhoto(
      id: (json['ID'] as num).toInt(),
      photoUrl: json['photoUrl'] as String,
    );

Map<String, dynamic> _$ExercisePhotoToJson(ExercisePhoto instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'photoUrl': instance.photoUrl,
    };
