import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/test_score.dart';
import '../../../application/test_score_service.dart';

class TestScoresCard extends ConsumerWidget {
  const TestScoresCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testScoresAsync = ref.watch(
      testScoreNotifierProvider(1),
    ); // Assuming user ID 1

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.quiz, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Test Scores',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Test scores content
            testScoresAsync.when(
              data: (testScores) => _buildTestScoresList(context, testScores),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => _buildErrorState(context),
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.go('/test-scores'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Add/Update Scores'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestScoresList(
    BuildContext context,
    List<TestScore> testScores,
  ) {
    if (testScores.isEmpty) {
      return Column(
        children: [
          _buildInfoRow(context, '• No test scores recorded yet'),
          _buildInfoRow(context, '• Add your IELTS, TOEFL, or GRE scores'),
        ],
      );
    }

    return Column(
      children: testScores
          .map((score) => _buildTestScoreRow(context, score))
          .toList(),
    );
  }

  Widget _buildTestScoreRow(BuildContext context, TestScore score) {
    final isCompleted = score.overallScore > 0;
    final displayText = isCompleted
        ? '• ${score.testType.toUpperCase()}: ${score.overallScore}${_getScoreUnit(score.testType)}'
        : '• ${score.testType.toUpperCase()}: Not taken';

    final expiryText = isCompleted && _hasExpiry(score.testType)
        ? ' (expires ${_formatExpiryDate(score.testDate)})'
        : '';

    return _buildInfoRow(
      context,
      displayText + expiryText,
      isCompleted: isCompleted,
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String text, {
    bool isCompleted = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          if (!isCompleted) ...[
            Icon(
              Icons.schedule,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isCompleted
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(
          'Failed to load test scores',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            // Trigger refresh - this will cause the provider to reload
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }

  String _getScoreUnit(String testType) {
    switch (testType.toLowerCase()) {
      case 'ielts':
        return '/9.0';
      case 'toefl':
        return '/120';
      case 'gre':
        return '/340';
      default:
        return '';
    }
  }

  bool _hasExpiry(String testType) {
    // IELTS and TOEFL typically expire after 2 years
    return ['ielts', 'toefl'].contains(testType.toLowerCase());
  }

  String _formatExpiryDate(DateTime testDate) {
    final expiryDate = testDate.add(const Duration(days: 730)); // 2 years
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[expiryDate.month - 1]} ${expiryDate.year}';
  }
}
