import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saku_beasiswa/core/config/app_router.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/profile/presentation/providers/profile_setup_provider.dart';

// --- Data for our dropdowns ---
const List<String> studyLevels = ['S1/Bachelor', 'S2/Master', 'S3/Doctorate'];
const List<String> commonMajors = [
  'Computer Science', 'Engineering', 'Medicine', 'Business', 'Arts & Humanities', 'Social Sciences', 'Other'
];

class ProfileSetupScreen extends ConsumerWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final formState = ref.watch(profileSetupProvider);
    final formNotifier = ref.read(profileSetupProvider.notifier);

return Scaffold(
    appBar: AppBar(
      title: const Text('Tell Us About You'),
      centerTitle: true,
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This helps us find the best scholarships for you.",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            // --- Study Level Dropdown ---
            Text('What is your current/target study level?',
                style: textTheme.titleSmall),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: formState.studyLevel,
              hint: const Text('Select study level'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.surface,
              ),
              items: studyLevels.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) formNotifier.setStudyLevel(value);
              },
            ),
            const SizedBox(height: 24),
            // --- Field of Study Dropdown ---
            Text('What is your field of study?',
                style: textTheme.titleSmall),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: formState.fieldOfStudy,
              hint: const Text('Select field of study'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: AppColors.surface,
              ),
              items: commonMajors.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) formNotifier.setFieldOfStudy(value);
              },
            ),
            // Note: Target countries will be added in the next iteration for simplicity.
            // A multi-select chip field would be ideal here.
          ],
        ),
      ),
    ),
    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () async {
            // Save the profile and navigate to template sync on success
            final success = await formNotifier.saveProfile();
            if (success && context.mounted) {
              print('Profile saved successfully');
              context.go('/template-sync');
            }
          },
          child: const Text('Continue'),
        ),
      ),
    ),
    );
  }
}
