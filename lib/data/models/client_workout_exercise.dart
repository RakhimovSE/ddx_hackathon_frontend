import 'package:json_annotation/json_annotation.dart';
import 'exercise.dart';
import 'client_exercise_set.dart';

part 'client_workout_exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class ClientWorkoutExercise {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'client_workout_id')
  final int clientWorkoutId;
  @JsonKey(name: 'exercise_id')
  final int exerciseId;
  @JsonKey(name: 'Sets')
  final List<ClientExerciseSet> sets;
  @JsonKey(name: 'rest_time')
  final int restTime;
  final int order;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @JsonKey(name: 'planned_start_date')
  final DateTime? plannedStartDate;
  @JsonKey(name: 'planned_end_date')
  final DateTime? plannedEndDate;
  @JsonKey(name: 'exercise')
  final Exercise exercise;

  ClientWorkoutExercise({
    required this.id,
    required this.clientWorkoutId,
    required this.exerciseId,
    required this.sets,
    required this.restTime,
    required this.order,
    this.startDate,
    this.endDate,
    this.plannedStartDate,
    this.plannedEndDate,
    required this.exercise,
  });

  factory ClientWorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$ClientWorkoutExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientWorkoutExerciseToJson(this);
}
