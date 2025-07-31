import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_score.freezed.dart';
part 'test_score.g.dart';

@freezed
abstract class TestScore with _$TestScore {
  const factory TestScore({
    required int id,
    required int userId,
    required String testType, // e.g., 'ielts', 'toefl', 'gre'
    required double overallScore,
    required DateTime testDate,
    String? detailedScores, // JSON string for sub-scores
    required DateTime createdAt,
  }) = _TestScore;

  factory TestScore.fromJson(Map<String, dynamic> json) =>
      _$TestScoreFromJson(json);
}
