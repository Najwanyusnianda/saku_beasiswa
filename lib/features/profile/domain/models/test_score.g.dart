// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestScore _$TestScoreFromJson(Map<String, dynamic> json) => _TestScore(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  testType: json['testType'] as String,
  overallScore: (json['overallScore'] as num).toDouble(),
  testDate: DateTime.parse(json['testDate'] as String),
  detailedScores: json['detailedScores'] as String?,
  certificateUrl: json['certificateUrl'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TestScoreToJson(_TestScore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'testType': instance.testType,
      'overallScore': instance.overallScore,
      'testDate': instance.testDate.toIso8601String(),
      'detailedScores': instance.detailedScores,
      'certificateUrl': instance.certificateUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
