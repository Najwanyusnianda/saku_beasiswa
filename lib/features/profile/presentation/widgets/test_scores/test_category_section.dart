import 'package:flutter/material.dart';

import '../../../domain/models/test_score.dart';
import 'test_type_config.dart';
import 'existing_test_card.dart';
import 'add_test_card.dart';

class TestCategorySection extends StatelessWidget {
  final TestCategory category;
  final List<TestScore> allScores;
  final dynamic profile;
  final Function(TestScore) onEditScore;
  final Function(TestScore) onDeleteScore;
  final Function(TestScore) onCertificate;
  final Function(String) onAddScore;

  const TestCategorySection({
    super.key,
    required this.category,
    required this.allScores,
    required this.profile,
    required this.onEditScore,
    required this.onDeleteScore,
    required this.onCertificate,
    required this.onAddScore,
  });

  @override
  Widget build(BuildContext context) {
    final categoryTestTypes = testCategoryMapping[category] ?? [];
    final categoryScores = allScores
        .where(
          (score) => categoryTestTypes.contains(score.testType.toLowerCase()),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category title - Section header (updated to follow guidelines)
        Text(
          category.displayName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        ...categoryTestTypes.map((testTypeId) {
          final testType = testTypes[testTypeId]!;
          final existingScores = categoryScores.where(
            (score) => score.testType.toLowerCase() == testTypeId,
          );
          final existingScore = existingScores.isNotEmpty
              ? existingScores.first
              : null;

          if (existingScore != null) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ExistingTestCard(
                testScore: existingScore,
                testType: testType,
                onEdit: () => onEditScore(existingScore),
                onDelete: () => onDeleteScore(existingScore),
                onCertificate: () => onCertificate(existingScore),
              ),
            );
          } else {
            // Show "Add Test" card only if it's relevant for the user
            if (_shouldShowAddTestCard(testTypeId, profile, allScores)) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AddTestCard(
                  testType: testType,
                  onTap: () => onAddScore(testTypeId),
                ),
              );
            }
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  bool _shouldShowAddTestCard(
    String testTypeId,
    dynamic profile,
    List<TestScore> allScores,
  ) {
    // Always show English test cards if none exist
    if (testTypeId == 'ielts' || testTypeId == 'toefl') {
      final hasEnglishTest = allScores.any(
        (score) =>
            score.testType.toLowerCase() == 'ielts' ||
            score.testType.toLowerCase() == 'toefl',
      );
      return !hasEnglishTest;
    }

    // Show graduate test cards for Master's/PhD students
    if (testTypeId == 'gre' || testTypeId == 'gmat') {
      final educationLevel = profile.currentEducationLevel?.toLowerCase() ?? '';
      final isGraduateLevel =
          educationLevel.contains('s2') ||
          educationLevel.contains('s3') ||
          educationLevel.contains('magister') ||
          educationLevel.contains('doktor');
      return isGraduateLevel;
    }

    return false;
  }
}
