// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) => TrainingPlan(
      id: (json['ID'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      workouts: (json['Workouts'] as List<dynamic>)
          .map((e) => Workout.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdById: (json['created_by_id'] as num).toInt(),
      createdBy: User.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainingPlanToJson(TrainingPlan instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'name': instance.name,
      'description': instance.description,
      'Workouts': instance.workouts.map((e) => e.toJson()).toList(),
      'created_by_id': instance.createdById,
      'created_by': instance.createdBy.toJson(),
    };
