import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/user_profile_repository.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';

part 'template_matching_provider.g.dart';

// This FutureProvider will:
// 1. Fetch the user's profile.
// 2. Use the profile to query for matching templates.
// 3. Return the list of matched templates.
// The UI will automatically show loading/error/data states.
@riverpod
Future<List<ScholarshipTemplate>> matchingTemplates(Ref ref) async {
  final userProfileRepo = ref.watch(userProfileRepositoryProvider);
  final templateRepo = ref.watch(scholarshipTemplateRepositoryProvider);
  
  final profile = await userProfileRepo.getProfile();
  
  if (profile == null) {
    // This should not happen if the flow is correct, but it's a good safeguard.
    throw Exception('User profile not found!');
  }
  
  final formModel = ProfileSetupFormModel(
    studyLevel: profile.studyLevel,
    fieldOfStudy: profile.fieldOfStudy,
   // targetCountries:profile.targetCountries,
  );

  return templateRepo.findMatchingTemplates(formModel);
}
