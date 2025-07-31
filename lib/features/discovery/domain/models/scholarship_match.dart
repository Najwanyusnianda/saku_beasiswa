import 'package:freezed_annotation/freezed_annotation.dart';

part 'scholarship_match.freezed.dart';

/// Represents a scholarship with its calculated match score and metadata
/// This is what powers the "⭐ 94% Match" display in your card design
@freezed
abstract class ScholarshipMatch with _$ScholarshipMatch {
  const factory ScholarshipMatch({
    required String scholarshipId,
    required double matchScore, // 0.0 to 1.0 (displayed as percentage)
    required List<MatchReason> matchReasons,
    required bool isSaved,
    @Default(false) bool isInApplicationPlan,
    DateTime? lastViewed,
    DateTime? savedAt,
  }) = _ScholarshipMatch;
}

/// Explains why a scholarship matched the user's profile
/// Used for detailed match breakdown and "Why this matches you" sections
@freezed
abstract class MatchReason with _$MatchReason {
  const factory MatchReason({
    required MatchCriteria criteria,
    required String description,
    required double weight, // How much this reason contributes to the overall score
    required double score, // 0.0 to 1.0 for this specific criterion
  }) = _MatchReason;
}

/// Different criteria used for matching scholarships to user profiles
enum MatchCriteria {
  @JsonValue('education_level')
  educationLevel,
  @JsonValue('field_of_study')
  fieldOfStudy,
  @JsonValue('target_country')
  targetCountry,
  @JsonValue('gpa_requirement')
  gpaRequirement,
  @JsonValue('language_proficiency')
  languageProficiency,
  @JsonValue('funding_type')
  fundingType,
  @JsonValue('application_deadline')
  applicationDeadline,
  @JsonValue('age_requirement')
  ageRequirement,
  @JsonValue('nationality')
  nationality,
  @JsonValue('work_experience')
  workExperience,
}

/// Quick scholarship card data for the Instagram-like feed
/// This contains all the data needed to render a scholarship card efficiently
@freezed
abstract class ScholarshipCardData with _$ScholarshipCardData {
  const ScholarshipCardData._(); // Private constructor required for getters
  
  const factory ScholarshipCardData({
    required String id,
    required String title,
    required String provider,
    required String providerCountry,
    required String countryFlag, // Emoji flag for the country
    required String fundingType,
    required String fundingAmount,
    required String degreeLevel,
    required DateTime applicationDeadline,
    required double matchScore,
    required bool isSaved,
    @Default(false) bool isInApplicationPlan,
    required String scholarshipEmoji, // 📍 or other relevant emoji
    List<String>? quickTags, // ['Full Funding', 'No GPA Limit']
  }) = _ScholarshipCardData;

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
      return DeadlineUrgency.expired;
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
  normal,   // Green/neutral
  soon,     // Yellow/warning
  urgent,   // Orange/urgent
  expired,  // Red/danger
}
