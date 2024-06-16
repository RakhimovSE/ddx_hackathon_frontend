import 'package:json_annotation/json_annotation.dart';
import 'exercise.dart';
import 'exercise_set.dart';

part 'workout_exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class WorkoutExercise {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'workout_id')
  final int workoutId;
  @JsonKey(name: 'exercise_id')
  final int exerciseId;
  @JsonKey(name: 'rest_time')
  final int restTime;
  final int order;
  @JsonKey(name: 'Sets')
  final List<ExerciseSet> sets;
  @JsonKey(name: 'exercise')
  final Exercise exercise;

  WorkoutExercise({
    required this.id,
    required this.workoutId,
    required this.exerciseId,
    required this.restTime,
    required this.order,
    required this.sets,
    required this.exercise,
  });

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutExerciseToJson(this);
}
