class TrainingPlan {
  final int id;
  final String title;
  final String content;
  final int userId;

  TrainingPlan(
      {required this.id,
      required this.title,
      required this.content,
      required this.userId});

  factory TrainingPlan.fromJson(Map<String, dynamic> json) {
    return TrainingPlan(
      id: json['ID'],
      title: json['title'],
      content: json['content'],
      userId: json['user_id'],
    );
  }
}
