import 'package:freezed_annotation/freezed_annotation.dart';

part 'scholarship_card_dto.freezed.dart';

/// Data Transfer Object for scholarship card display
/// This prevents the presentation layer from directly importing domain models
/// Following Clean Architecture: Presentation → Application layer only
@freezed
abstract class ScholarshipCardDto with _$ScholarshipCardDto {
  const ScholarshipCardDto._(); // Private constructor for getters

  const factory ScholarshipCardDto({
    required String id,
    required String title,
    required String provider,
    required String providerCountry,
    required String countryFlag,
    required String fundingType,
    required String fundingAmount,
    required String degreeLevel,
    required DateTime applicationDeadline,
    required double matchScore,
    required bool isSaved,
    @Default(false) bool isInApplicationPlan,
    required String scholarshipEmoji,
    @Default([]) List<String> quickTags,
    @Default([]) List<String> subjectAreas,
  }) = _ScholarshipCardDto;

  /// Helper to get formatted match percentage
  String get matchPercentage => '${(matchScore * 100).round()}%';

  /// Helper to get formatted deadline
  String get deadlineFormatted {
    final now = DateTime.now();
    final difference = applicationDeadline.difference(now).inDays;

    if (difference < 0) {
      return 'Deadline passed';
    } else if (difference == 0) {
      return 'Due today';
    } else if (difference == 1) {
      return 'Due tomorrow';
    } else if (difference <= 7) {
      return 'Due in $difference days';
    } else if (difference <= 30) {
      return 'Due in ${(difference / 7).round()} weeks';
    } else {
      final months = (difference / 30).round();
      return months == 1 ? 'Due in 1 month' : 'Due in $months months';
    }
  }

  /// Helper to get urgency level for UI styling
  DeadlineUrgency get urgencyLevel {
    final now = DateTime.now();
    final difference = applicationDeadline.difference(now).inDays;

    if (difference < 0) {
      return DeadlineUrgency.passed;
    } else if (difference <= 7) {
      return DeadlineUrgency.urgent;
    } else if (difference <= 30) {
      return DeadlineUrgency.soon;
    } else {
      return DeadlineUrgency.normal;
    }
  }
}

/// Deadline urgency levels for UI styling
enum DeadlineUrgency {
  passed,
  urgent,
  soon,
  normal,
}
