import 'package:flutter/material.dart';
import '../test_type_config.dart';

class ScoreInputSection extends StatelessWidget {
  final TextEditingController overallScoreController;
  final String? selectedTestType;
  final Map<String, TextEditingController> skillControllers;

  const ScoreInputSection({
    super.key,
    required this.overallScoreController,
    required this.selectedTestType,
    required this.skillControllers,
  });

  @override
  Widget build(BuildContext context) {
    final testType = selectedTestType != null
        ? testTypes[selectedTestType!]
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title with better hierarchy
        Text(
          'Score Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),

        // Overall Score with improved styling
        TextFormField(
          controller: overallScoreController,
          decoration: InputDecoration(
            labelText: 'Overall Score',
            helperText: testType != null
                ? 'Required • Maximum: ${testType.maxScore}'
                : 'Required field',
            helperStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
            hintText: testType != null
                ? 'Enter score (0 - ${testType.maxScore})'
                : 'Enter your overall score',
            hintStyle: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withOpacity(0.7),
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.star_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.3),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Overall score is required';
            }
            final score = double.tryParse(value.trim());
            if (score == null) {
              return 'Please enter a valid number';
            }
            if (testType != null && score > testType.maxScore) {
              return 'Score cannot exceed ${testType.maxScore}';
            }
            if (score < 0) {
              return 'Score cannot be negative';
            }
            return null;
          },
        ),

        // Skill breakdown section with improved design
        if (selectedTestType != null && skillControllers.isNotEmpty) ...[
          const SizedBox(height: 24),

          // Divider for visual separation
          Divider(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            thickness: 1,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Skill Breakdown',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Optional',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(
            'Break down your ${testType?.name ?? 'test'} score by individual skills',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 16),

          // Skill input fields in a grid layout for better organization
          ...testType!.skillNames.asMap().entries.map((entry) {
            final index = entry.key;
            final skill = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < testType.skillNames.length - 1 ? 16 : 0,
              ),
              child: TextFormField(
                controller: skillControllers[skill],
                decoration: InputDecoration(
                  labelText: skill,
                  hintText: 'Enter $skill score',
                  hintStyle: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withOpacity(0.7),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    _getSkillIcon(skill),
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    final score = double.tryParse(value.trim());
                    if (score == null) {
                      return 'Please enter a valid number';
                    }
                    if (score > testType.maxScore) {
                      return 'Score cannot exceed ${testType.maxScore}';
                    }
                    if (score < 0) {
                      return 'Score cannot be negative';
                    }
                  }
                  return null;
                },
              ),
            );
          }),
        ],
      ],
    );
  }

  IconData _getSkillIcon(String skill) {
    final skillLower = skill.toLowerCase();
    if (skillLower.contains('listening')) return Icons.hearing;
    if (skillLower.contains('reading')) return Icons.book;
    if (skillLower.contains('writing')) return Icons.edit;
    if (skillLower.contains('speaking')) return Icons.mic;
    if (skillLower.contains('verbal')) return Icons.chat;
    if (skillLower.contains('quantitative')) return Icons.calculate;
    if (skillLower.contains('analytical')) return Icons.analytics;
    return Icons.quiz;
  }
}
