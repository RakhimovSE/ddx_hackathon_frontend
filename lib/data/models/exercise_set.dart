import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable()
class ExerciseSet {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'workout_exercise_id')
  final int workoutExerciseId;
  final int reps;
  final int duration;
  @JsonKey(name: 'rest_time')
  final int restTime;
  final int order;

  ExerciseSet({
    required this.id,
    required this.workoutExerciseId,
    required this.reps,
    required this.duration,
    required this.restTime,
    required this.order,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
