import 'package:json_annotation/json_annotation.dart';

part 'training_plan.g.dart';

@JsonSerializable()
class TrainingPlan {
  final int id;
  final String title;
  final String content;
  final int userId;

  TrainingPlan({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
  });

  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingPlanToJson(this);
}
