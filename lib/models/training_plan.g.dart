// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) => TrainingPlan(
      id: (json['ID'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$TrainingPlanToJson(TrainingPlan instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'title': instance.title,
      'content': instance.content,
      'userId': instance.userId,
    };
