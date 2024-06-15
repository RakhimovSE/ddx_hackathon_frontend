// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerProfile _$TrainerProfileFromJson(Map<String, dynamic> json) =>
    TrainerProfile(
      specialties: (json['specialties'] as List<dynamic>)
          .map((e) => Specialty.fromJson(e as Map<String, dynamic>))
          .toList(),
      experience: (json['experience'] as num).toInt(),
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$TrainerProfileToJson(TrainerProfile instance) =>
    <String, dynamic>{
      'specialties': instance.specialties,
      'experience': instance.experience,
      'bio': instance.bio,
    };
