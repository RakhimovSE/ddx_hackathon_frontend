import 'package:json_annotation/json_annotation.dart';

part 'client_exercise_set.g.dart';

@JsonSerializable()
class ClientExerciseSet {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'client_workout_exercise_id')
  final int clientWorkoutExerciseId;
  @JsonKey(name: 'reps')
  final int reps;
  @JsonKey(name: 'duration')
  final int duration;
  @JsonKey(name: 'rest_time')
  final int restTime;
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

  ClientExerciseSet({
    required this.id,
    required this.clientWorkoutExerciseId,
    required this.reps,
    required this.duration,
    required this.restTime,
    required this.order,
    this.startDate,
    this.endDate,
    this.plannedStartDate,
    this.plannedEndDate,
  });

  factory ClientExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ClientExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ClientExerciseSetToJson(this);
}
