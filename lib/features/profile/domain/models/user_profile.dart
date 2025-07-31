import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String fullName,
    required String email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? city,
    required String currentEducationLevel,
    required String institution,
    required String majorField,
    double? currentGpa,
    DateTime? expectedGraduation,
    String? profilePhotoPath,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
