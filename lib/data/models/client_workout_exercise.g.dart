// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientWorkoutExercise _$ClientWorkoutExerciseFromJson(
        Map<String, dynamic> json) =>
    ClientWorkoutExercise(
      id: (json['ID'] as num).toInt(),
      clientWorkoutId: (json['client_workout_id'] as num).toInt(),
      workoutExerciseId: (json['workout_exercise_id'] as num).toInt(),
      sets: (json['Sets'] as List<dynamic>)
          .map((e) => ClientExerciseSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      restTime: (json['rest_time'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      plannedStartDate: json['planned_start_date'] == null
          ? null
          : DateTime.parse(json['planned_start_date'] as String),
      plannedEndDate: json['planned_end_date'] == null
          ? null
          : DateTime.parse(json['planned_end_date'] as String),
    );

Map<String, dynamic> _$ClientWorkoutExerciseToJson(
        ClientWorkoutExercise instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'client_workout_id': instance.clientWorkoutId,
      'workout_exercise_id': instance.workoutExerciseId,
      'Sets': instance.sets.map((e) => e.toJson()).toList(),
      'rest_time': instance.restTime,
      'order': instance.order,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'planned_start_date': instance.plannedStartDate?.toIso8601String(),
      'planned_end_date': instance.plannedEndDate?.toIso8601String(),
    };
