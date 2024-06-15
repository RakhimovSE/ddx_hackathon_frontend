// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: (json['ID'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      clientId: (json['clientId'] as num).toInt(),
      trainerId: (json['trainerId'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'ID': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'clientId': instance.clientId,
      'trainerId': instance.trainerId,
    };
