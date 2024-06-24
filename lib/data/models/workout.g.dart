// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) => Workout(
      id: (json['ID'] as num).toInt(),
      trainingPlanId: (json['training_plan_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      daysUntilNext: (json['days_until_next'] as num).toInt(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'ID': instance.id,
      'training_plan_id': instance.trainingPlanId,
      'name': instance.name,
      'description': instance.description,
      'days_until_next': instance.daysUntilNext,
      'order': instance.order,
    };
