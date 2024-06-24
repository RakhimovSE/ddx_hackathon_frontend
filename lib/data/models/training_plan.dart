import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
import 'workout.dart';

part 'training_plan.g.dart';

@JsonSerializable(explicitToJson: true)
class TrainingPlan {
  @JsonKey(name: 'ID')
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'Workouts')
  final List<Workout> workouts;
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @JsonKey(name: 'created_by')
  final User createdBy;

  TrainingPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.workouts,
    required this.createdById,
    required this.createdBy,
  });

  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingPlanToJson(this);
}
