// lib/features/templates/presentation/widgets/template_card.dart
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

class TemplateCard extends StatelessWidget {
  final ScholarshipTemplate template;
  final bool isAdded;
  final VoidCallback onTap;

  const TemplateCard({
    super.key,
    required this.template,
    required this.isAdded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // Use a more subtle style for a modern look
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200, width: 1.5),
      ),
      margin: const EdgeInsets.only(bottom: 12), // Adjusted margin
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap, // The whole card is tappable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: const Icon(Iconsax.award, color: AppColors.primary, size: 24),
                  ),
                  const SizedBox(width: 12),
                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          template.name,
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2, // Allow for longer names
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          template.providerName,
                          style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Status Icon (replaces the button)
                  if (isAdded)
                    const Icon(Iconsax.tick_circle, color: AppColors.success, size: 24),
                ],
              ),
              const SizedBox(height: 16),
              // --- Info Chips ---
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  if (template.country != null)
                    _InfoChip(
                      icon: Iconsax.location,
                      label: template.country!,
                    ),
                  _InfoChip(
                    icon: Iconsax.level,
                    label: template.studyLevel,
                  ),
                  if (template.fundingType != null)
                    _InfoChip(
                      icon: Iconsax.money_2,
                      label: template.fundingType!,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for the small info chips to keep the build method clean
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}