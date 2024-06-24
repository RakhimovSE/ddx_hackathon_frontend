import 'package:json_annotation/json_annotation.dart';

part 'workout.g.dart';

@JsonSerializable()
class Workout {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'training_plan_id')
  final int trainingPlanId;
  final String name;
  final String description;
  @JsonKey(name: 'days_until_next')
  final int daysUntilNext;
  final int order;

  Workout({
    required this.id,
    required this.trainingPlanId,
    required this.name,
    required this.description,
    required this.daysUntilNext,
    required this.order,
  });

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
