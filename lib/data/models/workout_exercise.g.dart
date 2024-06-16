// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) =>
    WorkoutExercise(
      id: (json['ID'] as num).toInt(),
      workoutId: (json['workout_id'] as num).toInt(),
      exerciseId: (json['exercise_id'] as num).toInt(),
      restTime: (json['rest_time'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      sets: (json['Sets'] as List<dynamic>)
          .map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkoutExerciseToJson(WorkoutExercise instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'workout_id': instance.workoutId,
      'exercise_id': instance.exerciseId,
      'rest_time': instance.restTime,
      'order': instance.order,
      'Sets': instance.sets.map((e) => e.toJson()).toList(),
      'exercise': instance.exercise.toJson(),
    };
