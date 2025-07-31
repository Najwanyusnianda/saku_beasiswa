import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/test_score_service.dart';
import '../../application/profile_service.dart';
import '../../domain/models/test_score.dart';
import '../widgets/test_scores/test_category_section.dart';
import '../widgets/test_scores/test_scores_tips_section.dart';
import '../widgets/test_scores/test_score_form_dialog.dart';
import '../widgets/test_scores/test_type_config.dart';

class TestScoresScreen extends ConsumerWidget {
  const TestScoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Scores'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTestScoreDialog(context, ref),
            tooltip: 'Add Test Score',
          ),
        ],
      ),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(
              child: Text('Please set up your profile first'),
            );
          }

          final testScoresAsync = ref.watch(
            testScoreNotifierProvider(profile.id),
          );

          return testScoresAsync.when(
            data: (testScores) =>
                _buildTestScoresBody(context, ref, profile.id, testScores),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading test scores',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        ref.invalidate(testScoreNotifierProvider(profile.id)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_off,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading profile',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileNotifierProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestScoresBody(
    BuildContext context,
    WidgetRef ref,
    int userId,
    List<TestScore> testScores,
  ) {
    final profile = ref.read(profileNotifierProvider).value;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Text(
            'Test Scores',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Track your test scores to find matching scholarships',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),

          // Tips section
          const TestScoresTipsSection(),
          const SizedBox(height: 24),

          // English Proficiency Tests
          TestCategorySection(
            category: TestCategory.englishProficiency,
            allScores: testScores,
            profile: profile,
            onEditScore: (testScore) =>
                _showEditTestScoreDialog(context, ref, testScore),
            onDeleteScore: (testScore) =>
                _showDeleteConfirmation(context, ref, testScore),
            onCertificate: (testScore) =>
                _launchCertificateUrl(context, testScore),
            onAddScore: (testType) => _showAddTestScoreDialog(
              context,
              ref,
              preselectedTestType: testType,
            ),
          ),
          const SizedBox(height: 24),

          // Graduate Tests
          TestCategorySection(
            category: TestCategory.graduateTests,
            allScores: testScores,
            profile: profile,
            onEditScore: (testScore) =>
                _showEditTestScoreDialog(context, ref, testScore),
            onDeleteScore: (testScore) =>
                _showDeleteConfirmation(context, ref, testScore),
            onCertificate: (testScore) =>
                _launchCertificateUrl(context, testScore),
            onAddScore: (testType) => _showAddTestScoreDialog(
              context,
              ref,
              preselectedTestType: testType,
            ),
          ),
        ],
      ),
    );
  }

  void _launchCertificateUrl(BuildContext context, TestScore testScore) {
    final certificateUrl = testScore.certificateUrl;

    if (certificateUrl != null && certificateUrl.isNotEmpty) {
      // In a real app, you would use url_launcher package
      // For now, we'll show a dialog with the URL
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Certificate URL'),
          content: SelectableText(certificateUrl),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No certificate URL found for this test score'),
        ),
      );
    }
  }

  void _showAddTestScoreDialog(
    BuildContext context,
    WidgetRef ref, {
    String? preselectedTestType,
  }) {
    showDialog(
      context: context,
      builder: (context) => TestScoreFormDialog(
        title: 'Add Test Score',
        preselectedTestType: preselectedTestType,
        onSave: (testScore) async {
          try {
            final profile = ref.read(profileNotifierProvider).value;
            if (profile != null) {
              final newTestScore = testScore.copyWith(userId: profile.id);
              await ref
                  .read(testScoreNotifierProvider(profile.id).notifier)
                  .addTestScore(newTestScore);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${testScore.testType.toUpperCase()} score added successfully',
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error adding test score: $e'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          }
        },
      ),
    );
  }

  void _showEditTestScoreDialog(
    BuildContext context,
    WidgetRef ref,
    TestScore testScore,
  ) {
    showDialog(
      context: context,
      builder: (context) => TestScoreFormDialog(
        title: 'Edit Test Score',
        existingScore: testScore,
        onSave: (updatedTestScore) async {
          try {
            final profile = ref.read(profileNotifierProvider).value;
            if (profile != null) {
              await ref
                  .read(testScoreNotifierProvider(profile.id).notifier)
                  .updateTestScore(updatedTestScore);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${updatedTestScore.testType.toUpperCase()} score updated successfully',
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error updating test score: $e'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          }
        },
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    TestScore testScore,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Test Score'),
        content: Text(
          'Are you sure you want to delete your ${testScore.testType.toUpperCase()} score?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final profile = ref.read(profileNotifierProvider).value;
                if (profile != null) {
                  await ref
                      .read(testScoreNotifierProvider(profile.id).notifier)
                      .deleteTestScore(testScore.id, profile.id);

                  if (context.mounted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${testScore.testType.toUpperCase()} score deleted successfully',
                        ),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error deleting test score: $e'),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
