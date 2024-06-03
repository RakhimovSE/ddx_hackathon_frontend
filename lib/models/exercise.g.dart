// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
      muscle: json['muscle'] as String,
      additionalMuscle: json['additionalMuscle'] as String,
      type: json['type'] as String,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as String,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => ExercisePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
      'muscle': instance.muscle,
      'additionalMuscle': instance.additionalMuscle,
      'type': instance.type,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
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
