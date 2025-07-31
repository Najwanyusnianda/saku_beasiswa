// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  city: json['city'] as String?,
  currentEducationLevel: json['currentEducationLevel'] as String,
  institution: json['institution'] as String,
  majorField: json['majorField'] as String,
  currentGpa: (json['currentGpa'] as num?)?.toDouble(),
  expectedGraduation: json['expectedGraduation'] == null
      ? null
      : DateTime.parse(json['expectedGraduation'] as String),
  profilePhotoPath: json['profilePhotoPath'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'city': instance.city,
      'currentEducationLevel': instance.currentEducationLevel,
      'institution': instance.institution,
      'majorField': instance.majorField,
      'currentGpa': instance.currentGpa,
      'expectedGraduation': instance.expectedGraduation?.toIso8601String(),
      'profilePhotoPath': instance.profilePhotoPath,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
