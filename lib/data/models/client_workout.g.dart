// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientWorkout _$ClientWorkoutFromJson(Map<String, dynamic> json) =>
    ClientWorkout(
      id: (json['ID'] as num).toInt(),
      clientTrainingPlanId: (json['client_training_plan_id'] as num).toInt(),
      workoutId: (json['workout_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      exercises: (json['Exercises'] as List<dynamic>)
          .map((e) => ClientWorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$ClientWorkoutToJson(ClientWorkout instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'client_training_plan_id': instance.clientTrainingPlanId,
      'workout_id': instance.workoutId,
      'name': instance.name,
      'description': instance.description,
      'Exercises': instance.exercises,
      'order': instance.order,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'planned_start_date': instance.plannedStartDate?.toIso8601String(),
      'planned_end_date': instance.plannedEndDate?.toIso8601String(),
    };
