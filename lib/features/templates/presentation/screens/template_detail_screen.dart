import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class TemplateDetailScreen extends ConsumerWidget {
  final String templateId;

  const TemplateDetailScreen({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch our new provider to get the template details
    final templateAsync = ref.watch(templateDetailProvider(templateId));

    return Scaffold(
      appBar: AppBar(
        title: templateAsync.when(
          data: (template) => Text(template.name),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
      ),
      body: templateAsync.when(
        data: (template) {
          final stages = (template.defaultStages != null && template.defaultStages!.isNotEmpty)
              ? jsonDecode(template.defaultStages!) as List
              : [];

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              // --- Header ---
              Text(template.providerName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(template.description ?? 'No description available.', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              if (template.website != null)
                TextButton.icon(
                  icon: const Icon(Iconsax.global),
                  label: const Text('Visit Official Website'),
                  onPressed: () async {
                    final uri = Uri.parse(template.website!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              const Divider(height: 32),

              // --- Key Info ---
              Text('Key Information', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildInfoRow(Iconsax.level, 'Study Levels', template.studyLevels),
              _buildInfoRow(Iconsax.book_1, 'Fields of Study', template.fieldsOfStudy),
              _buildInfoRow(Iconsax.map_1, 'Target Countries', template.targetCountries),
              _buildInfoRow(Iconsax.global_search, 'Region', template.region),
              const Divider(height: 32),

              // --- Default Stages ---
              Text('Default Application Stages', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (stages.isEmpty)
                const Text('No default stages specified.')
              else
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: stages.map((stage) {
                    return Chip(
                      avatar: const Icon(Iconsax.task_square, color: AppColors.textSecondary, size: 18),
                      label: Text(stage['title']),
                      backgroundColor: AppColors.surface,
                    );
                  }).toList(),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Could not load details. Error: $err')),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
