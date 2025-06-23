//lib/features/templates/presentation/providers/template_matching_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/user_profile_repository.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';

part 'template_matching_provider.g.dart';


@riverpod
Future<List<ScholarshipTemplate>> matchingTemplates(Ref ref) async {
  final userProfileRepo = ref.watch(userProfileRepositoryProvider);
  final templateRepo = ref.watch(scholarshipTemplateRepositoryProvider);
  
  final profile = await userProfileRepo.getProfile();
  
  if (profile == null) {
    
    throw Exception('User profile not found!');
  }
  
  final formModel = ProfileSetupFormModel(
    studyLevel: profile.studyLevel,
    fieldOfStudy: profile.fieldOfStudy,
   // targetCountries:profile.targetCountries,
  );

  return templateRepo.findMatchingTemplates(formModel);
}
