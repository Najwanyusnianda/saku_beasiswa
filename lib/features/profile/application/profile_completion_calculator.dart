import '../domain/models/user_profile.dart';

class ProfileCompletionCalculator {
  /// Calculates the profile completion percentage based on filled fields
  static int calculateCompletionPercentage(UserProfile? profile) {
    if (profile == null) return 0;

    int totalFields = 10; // Total number of profile fields
    int filledFields = 0;

    // Required fields (always count as filled if they exist)
    if (profile.fullName.isNotEmpty) filledFields++;
    if (profile.email.isNotEmpty) filledFields++;
    if (profile.currentEducationLevel.isNotEmpty) filledFields++;
    if (profile.institution.isNotEmpty) filledFields++;
    if (profile.majorField.isNotEmpty) filledFields++;

    // Optional fields
    if (profile.phoneNumber != null && profile.phoneNumber!.isNotEmpty)
      filledFields++;
    if (profile.dateOfBirth != null) filledFields++;
    if (profile.city != null && profile.city!.isNotEmpty) filledFields++;
    if (profile.currentGpa != null) filledFields++;
    if (profile.expectedGraduation != null) filledFields++;

    return ((filledFields / totalFields) * 100).round();
  }

  /// Returns a completion status message
  static String getCompletionMessage(int percentage) {
    if (percentage >= 90) {
      return 'Profile Complete!';
    } else if (percentage >= 70) {
      return 'Almost done!';
    } else if (percentage >= 50) {
      return 'Profile ${percentage}% Complete';
    } else {
      return 'Complete your profile';
    }
  }

  /// Returns missing fields for profile completion
  static List<String> getMissingFields(UserProfile? profile) {
    if (profile == null) {
      return [
        'Full Name',
        'Email',
        'Education Level',
        'Institution',
        'Major Field',
      ];
    }

    List<String> missingFields = [];

    if (profile.fullName.isEmpty) missingFields.add('Full Name');
    if (profile.email.isEmpty) missingFields.add('Email');
    if (profile.currentEducationLevel.isEmpty)
      missingFields.add('Education Level');
    if (profile.institution.isEmpty) missingFields.add('Institution');
    if (profile.majorField.isEmpty) missingFields.add('Major Field');
    if (profile.phoneNumber == null || profile.phoneNumber!.isEmpty)
      missingFields.add('Phone Number');
    if (profile.dateOfBirth == null) missingFields.add('Date of Birth');
    if (profile.city == null || profile.city!.isEmpty)
      missingFields.add('City');
    if (profile.currentGpa == null) missingFields.add('GPA');
    if (profile.expectedGraduation == null)
      missingFields.add('Expected Graduation');

    return missingFields;
  }
}
