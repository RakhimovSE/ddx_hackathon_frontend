import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'client_training_plan.g.dart';

@JsonSerializable(explicitToJson: true)
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
  final DateTime? startDate;

  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  @JsonKey(name: 'planned_start_date')
  final DateTime plannedStartDate;

  @JsonKey(name: 'planned_end_date')
  final DateTime plannedEndDate;

  @JsonKey(name: 'created_by')
  final User createdBy;

  ClientTrainingPlan({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.trainingPlanId,
    required this.name,
    required this.description,
    this.startDate,
    this.endDate,
    required this.plannedStartDate,
    required this.plannedEndDate,
    required this.createdBy,
  });

  factory ClientTrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$ClientTrainingPlanFromJson(json);

  Map<String, dynamic> toJson() => _$ClientTrainingPlanToJson(this);
}
