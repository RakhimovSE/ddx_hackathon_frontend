import 'package:json_annotation/json_annotation.dart';
import 'client_workout_exercise.dart';

part 'client_workout.g.dart';

@JsonSerializable()
class ClientWorkout {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'client_training_plan_id')
  final int clientTrainingPlanId;
  @JsonKey(name: 'workout_id')
  final int workoutId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'Exercises')
  final List<ClientWorkoutExercise> exercises;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @JsonKey(name: 'planned_start_date')
  final DateTime? plannedStartDate;
  @JsonKey(name: 'planned_end_date')
  final DateTime? plannedEndDate;

  ClientWorkout({
    required this.id,
    required this.clientTrainingPlanId,
    required this.workoutId,
    required this.name,
    required this.description,
    required this.exercises,
    required this.order,
    this.startDate,
    this.endDate,
    this.plannedStartDate,
    this.plannedEndDate,
  });

  factory ClientWorkout.fromJson(Map<String, dynamic> json) =>
      _$ClientWorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$ClientWorkoutToJson(this);
}
