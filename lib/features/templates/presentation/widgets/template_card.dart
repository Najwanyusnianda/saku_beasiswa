import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

class TemplateCard extends StatelessWidget {
  final ScholarshipTemplate template;
  final bool isAdded;
  final VoidCallback onAdd;
  final VoidCallback? onTap; // New callback for navigation

  const TemplateCard({
    super.key,
    required this.template,
    required this.isAdded,
    required this.onAdd,
    this.onTap, // Add to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell( // Use InkWell for the ripple effect and tap handling
        onTap: onTap, // Assign the navigation callback here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: const Icon(Iconsax.award, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      template.providerName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Show a checkmark when added, or a plus icon for quick add
              if (isAdded)
                const Icon(Iconsax.tick_circle, color: AppColors.success, size: 28)
              else
                IconButton(
                  icon: const Icon(Iconsax.add_circle),
                  color: AppColors.primary,
                  iconSize: 28,
                  onPressed: onAdd,
                  tooltip: 'Quick Add',
                )
            ],
          ),
        ),
      ),
    );
  }
}