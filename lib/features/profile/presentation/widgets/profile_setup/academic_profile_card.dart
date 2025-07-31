import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_profile.dart';

class AcademicProfileCard extends StatelessWidget {
  final AsyncValue<UserProfile?> profileAsync;

  const AcademicProfileCard({super.key, required this.profileAsync});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Academic Information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            profileAsync.when(
              data: (profile) => _buildProfileContent(context, profile),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, UserProfile? profile) {
    if (profile == null) {
      return _buildEmptyState(context);
    }
    return _buildProfileDetails(context, profile);
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      children: [
        Text(
          'No academic information available',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Use the edit button in the header to add your academic details',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileDetails(BuildContext context, UserProfile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          context,
          '• ${profile.currentEducationLevel} in ${profile.majorField}',
        ),
        _buildInfoRow(context, '• ${profile.institution}'),
        if (profile.currentGpa != null)
          _buildInfoRow(
            context,
            '• GPA: ${profile.currentGpa!.toStringAsFixed(2)}/4.00',
          ),
        if (profile.expectedGraduation != null)
          _buildInfoRow(
            context,
            '• Expected graduation: ${profile.expectedGraduation!.year}',
          ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
