import 'package:json_annotation/json_annotation.dart';

part 'client_training_plan.g.dart';

@JsonSerializable()
class ClientTrainingPlan {
  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  @JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  @JsonKey(name: 'DeletedAt')
  final DateTime? deletedAt;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'training_plan_id')
  final int trainingPlanId;

  final String name;
  final String description;

  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @JsonKey(name: 'end_date')
  final DateTime endDate;

  @JsonKey(name: 'planned_start_date')
  final DateTime? plannedStartDate;

  @JsonKey(name: 'planned_end_date')
  final DateTime? plannedEndDate;

  ClientTrainingPlan({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.trainingPlanId,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.plannedStartDate,
    this.plannedEndDate,
  });

  factory ClientTrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$ClientTrainingPlanFromJson(json);

  Map<String, dynamic> toJson() => _$ClientTrainingPlanToJson(this);
}
