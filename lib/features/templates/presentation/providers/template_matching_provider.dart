import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

part 'template_matching_provider.g.dart';

// This FutureProvider will:
// 1. Fetch the user's profile.
// 2. Use the profile to query for matching templates.
// 3. Return the list of matched templates.
// The UI will automatically show loading/error/data states.
@riverpod
Future<List<ScholarshipTemplate>> matchingTemplates(MatchingTemplatesRef ref) async {
  final userProfileRepo = ref.watch(userProfileRepositoryProvider);
  final templateRepo = ref.watch(scholarshipTemplateRepositoryProvider);
  
  final profile = await userProfileRepo.getProfile();
  
  if (profile == null) {
    // This should not happen if the flow is correct, but it's a good safeguard.
    throw Exception('User profile not found!');
  }
  
  return templateRepo.findMatchingTemplates(profile);
}
