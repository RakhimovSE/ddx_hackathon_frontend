import 'package:json_annotation/json_annotation.dart';

part 'client_workout.g.dart';

@JsonSerializable()
class ClientWorkout {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'client_training_plan_id')
  final int clientTrainingPlanId;
  @JsonKey(name: 'workout_id')
  final int workoutId;
  final String name;
  final String description;
  final int order;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @JsonKey(name: 'planned_start_date')
  final DateTime plannedStartDate;
  @JsonKey(name: 'planned_end_date')
  final DateTime plannedEndDate;

  ClientWorkout({
    required this.id,
    required this.clientTrainingPlanId,
    required this.workoutId,
    required this.name,
    required this.description,
    required this.order,
    this.startDate,
    this.endDate,
    required this.plannedStartDate,
    required this.plannedEndDate,
  });

  factory ClientWorkout.fromJson(Map<String, dynamic> json) =>
      _$ClientWorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$ClientWorkoutToJson(this);
}
