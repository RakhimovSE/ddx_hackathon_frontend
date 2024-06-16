// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSet _$ExerciseSetFromJson(Map<String, dynamic> json) => ExerciseSet(
      id: (json['ID'] as num).toInt(),
      workoutExerciseId: (json['workout_exercise_id'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      restTime: (json['rest_time'] as num).toInt(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$ExerciseSetToJson(ExerciseSet instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'workout_exercise_id': instance.workoutExerciseId,
      'reps': instance.reps,
      'duration': instance.duration,
      'rest_time': instance.restTime,
      'order': instance.order,
    };
