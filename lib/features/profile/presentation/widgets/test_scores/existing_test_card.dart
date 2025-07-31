import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/test_score.dart';
import 'test_type_config.dart';

class ExistingTestCard extends StatelessWidget {
  final TestScore testScore;
  final TestType testType;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onCertificate;

  const ExistingTestCard({
    super.key,
    required this.testScore,
    required this.testType,
    required this.onEdit,
    required this.onDelete,
    required this.onCertificate,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final expiryDate = testScore.testDate.add(testType.validityPeriod);
    final isExpired = expiryDate.isBefore(DateTime.now());
    final isExpiringSoon = expiryDate.isBefore(
      DateTime.now().add(const Duration(days: 90)),
    );

    // Parse detailed scores from string format
    final skillScores = _parseDetailedScores(
      testScore.detailedScores,
      testType.skillNames,
    );

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with test type and actions
            Row(
              children: [
                Text(testType.emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    testType.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Certificate indicator
                if (testScore.certificateUrl != null &&
                    testScore.certificateUrl!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_outlined,
                          size: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'Certified',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      onEdit();
                    } else if (value == 'delete') {
                      onDelete();
                    } else if (value == 'certificate') {
                      onCertificate();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 8),
                          Text('Edit Score'),
                        ],
                      ),
                    ),
                    // Only show certificate option if URL exists
                    if (testScore.certificateUrl != null &&
                        testScore.certificateUrl!.isNotEmpty)
                      const PopupMenuItem(
                        value: 'certificate',
                        child: Row(
                          children: [
                            Icon(Icons.description, size: 18),
                            SizedBox(width: 8),
                            Text('View Certificate'),
                          ],
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Overall Score
            Row(
              children: [
                Text(
                  'Overall Score: ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  testScore.overallScore.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Skill breakdown
            if (skillScores.isNotEmpty) ...[
              ...skillScores.entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Text('• ${entry.key}: '),
                      Text(
                        entry.value,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],

            // Test Date
            Text(
              'Test Date: ${dateFormat.format(testScore.testDate)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            // Expiry Date with status
            Row(
              children: [
                Text(
                  'Expires: ${dateFormat.format(expiryDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 8),
                if (isExpired)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'EXPIRED',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else if (isExpiringSoon)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'EXPIRING SOON',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String> _parseDetailedScores(
    String? detailedScores,
    List<String> skillNames,
  ) {
    final Map<String, String> result = {};
    if (detailedScores == null || detailedScores.isEmpty) return result;

    // Try to parse format like "L:8.0, R:7.5, W:7.0, S:7.5"
    final parts = detailedScores.split(',');
    for (final part in parts) {
      final trimmed = part.trim();
      if (trimmed.contains(':')) {
        final keyValue = trimmed.split(':');
        if (keyValue.length == 2) {
          final key = keyValue[0].trim();
          final value = keyValue[1].trim();

          // Map abbreviations to full skill names
          final fullSkillName = _mapSkillAbbreviation(key, skillNames);
          if (fullSkillName != null) {
            result[fullSkillName] = value;
          }
        }
      }
    }

    return result;
  }

  String? _mapSkillAbbreviation(String abbreviation, List<String> skillNames) {
    final abbr = abbreviation.toLowerCase();
    for (final skill in skillNames) {
      final skillLower = skill.toLowerCase();
      if (skillLower.startsWith(abbr) || skillLower.contains(abbr)) {
        return skill;
      }
    }
    return null;
  }
}
