import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  @JsonKey(name: 'ID')
  final int id;
  final int rating;
  final String comment;
  final int clientId;
  final int trainerId;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.clientId,
    required this.trainerId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
