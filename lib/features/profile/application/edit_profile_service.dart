import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/models/user_profile.dart';
import 'profile_service.dart';

part 'edit_profile_service.g.dart';
part 'edit_profile_service.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool hasUnsavedChanges,
    @Default(false) bool isFormValid,
    UserProfile? currentProfile,
    UserProfile? formData,
    String? errorMessage,
  }) = _EditProfileState;
}

@riverpod
class EditProfileNotifier extends _$EditProfileNotifier {
  @override
  EditProfileState build() {
    return const EditProfileState();
  }

  Future<void> loadCurrentProfile() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final repository = ref.read(profileRepositoryProvider);
      final profile = await repository.getCurrentProfile();

      state = state.copyWith(
        isLoading: false,
        currentProfile: profile,
        formData: profile, // Initialize form with current data
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  void updateFormData({
    String? fullName,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? city,
    String? currentEducationLevel,
    String? institution,
    String? majorField,
    double? currentGpa,
    DateTime? expectedGraduation,
    String? profilePhotoPath,
  }) {
    if (state.formData == null) return;

    final updatedFormData = state.formData!.copyWith(
      fullName: fullName ?? state.formData!.fullName,
      email: email ?? state.formData!.email,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      city: city,
      currentEducationLevel:
          currentEducationLevel ?? state.formData!.currentEducationLevel,
      institution: institution ?? state.formData!.institution,
      majorField: majorField ?? state.formData!.majorField,
      currentGpa: currentGpa,
      expectedGraduation: expectedGraduation,
      profilePhotoPath: profilePhotoPath,
    );

    state = state.copyWith(
      formData: updatedFormData,
      hasUnsavedChanges: _hasChanges(state.currentProfile, updatedFormData),
      isFormValid: _isFormValid(updatedFormData),
    );
  }

  void markAsChanged() {
    if (state.currentProfile != null && state.formData != null) {
      state = state.copyWith(
        hasUnsavedChanges: _hasChanges(state.currentProfile, state.formData),
        isFormValid: _isFormValid(state.formData),
      );
    }
  }

  Future<void> saveProfile() async {
    if (state.formData == null || !state.isFormValid) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateUserProfile(state.formData!);

      state = state.copyWith(
        isLoading: false,
        hasUnsavedChanges: false,
        currentProfile: state.formData,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
      rethrow;
    }
  }

  bool _hasChanges(UserProfile? original, UserProfile? updated) {
    if (original == null || updated == null) return false;

    return original.fullName != updated.fullName ||
        original.email != updated.email ||
        original.phoneNumber != updated.phoneNumber ||
        original.dateOfBirth != updated.dateOfBirth ||
        original.city != updated.city ||
        original.currentEducationLevel != updated.currentEducationLevel ||
        original.institution != updated.institution ||
        original.majorField != updated.majorField ||
        original.currentGpa != updated.currentGpa ||
        original.expectedGraduation != updated.expectedGraduation ||
        original.profilePhotoPath != updated.profilePhotoPath;
  }

  bool _isFormValid(UserProfile? profile) {
    if (profile == null) return false;

    return profile.fullName.isNotEmpty &&
        profile.email.isNotEmpty &&
        profile.currentEducationLevel.isNotEmpty &&
        profile.institution.isNotEmpty &&
        profile.majorField.isNotEmpty;
  }
}
