// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientExerciseSet _$ClientExerciseSetFromJson(Map<String, dynamic> json) =>
    ClientExerciseSet(
      id: (json['ID'] as num).toInt(),
      clientWorkoutExerciseId:
          (json['client_workout_exercise_id'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
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

Map<String, dynamic> _$ClientExerciseSetToJson(ClientExerciseSet instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'client_workout_exercise_id': instance.clientWorkoutExerciseId,
      'reps': instance.reps,
      'duration': instance.duration,
      'rest_time': instance.restTime,
      'order': instance.order,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'planned_start_date': instance.plannedStartDate?.toIso8601String(),
      'planned_end_date': instance.plannedEndDate?.toIso8601String(),
    };
