// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_training_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientTrainingPlan _$ClientTrainingPlanFromJson(Map<String, dynamic> json) =>
    ClientTrainingPlan(
      id: (json['ID'] as num).toInt(),
      createdAt: DateTime.parse(json['CreatedAt'] as String),
      updatedAt: DateTime.parse(json['UpdatedAt'] as String),
      deletedAt: json['DeletedAt'] == null
          ? null
          : DateTime.parse(json['DeletedAt'] as String),
      userId: (json['user_id'] as num).toInt(),
      trainingPlanId: (json['training_plan_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      plannedStartDate: DateTime.parse(json['planned_start_date'] as String),
      plannedEndDate: DateTime.parse(json['planned_end_date'] as String),
      createdBy: User.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientTrainingPlanToJson(ClientTrainingPlan instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt.toIso8601String(),
      'UpdatedAt': instance.updatedAt.toIso8601String(),
      'DeletedAt': instance.deletedAt?.toIso8601String(),
      'user_id': instance.userId,
      'training_plan_id': instance.trainingPlanId,
      'name': instance.name,
      'description': instance.description,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'planned_start_date': instance.plannedStartDate.toIso8601String(),
      'planned_end_date': instance.plannedEndDate.toIso8601String(),
      'created_by': instance.createdBy.toJson(),
    };
