import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';

part 'profile_setup_provider.g.dart';

// State Notifier to manage the form data and logic
@riverpod
class ProfileSetup extends _$ProfileSetup {
  @override
  ProfileSetupFormModel build() {
    // Initial state is an empty form
    return const ProfileSetupFormModel();
  }

  void setStudyLevel(String level) {
    state = state.copyWith(studyLevel: level);
  }

  void setFieldOfStudy(String field) {
    state = state.copyWith(fieldOfStudy: field);
  }

  void setTargetCountries(List<String> countries) {
    state = state.copyWith(targetCountries: countries);
  }

  // The method that will be called when the user presses "Continue"
  Future<bool> saveProfile() async {
    final userProfileRepo = ref.read(userProfileRepositoryProvider);
    
    // Convert our form model to the Drift database entity
    final profileToSave = UserProfile(
      id: 1, // Hardcoded for single user
      studyLevel: state.studyLevel,
      fieldOfStudy: state.fieldOfStudy,
      targetCountries: state.targetCountries.join(','), // Join list to a string
    );
    
    try {
      await userProfileRepo.saveProfile(profileToSave);
      return true;
    } catch (e) {
      // In a real app, you would log this error
      return false;
    }
  }
}
