import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/dtos/scholarship_card_dto.dart';

/// Instagram-style scholarship card widget
/// Displays scholarship info in an engaging, social media-like format
class ScholarshipCard extends ConsumerWidget {
  final ScholarshipCardDto scholarship;
  final VoidCallback? onTap;
  final VoidCallback? onSave;
  final VoidCallback? onShare;
  final bool isCompact;

  const ScholarshipCard({
    super.key,
    required this.scholarship,
    this.onTap,
    this.onSave,
    this.onShare,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isCompact ? 6 : 12,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(theme),
              const SizedBox(height: 12),
              _buildContent(theme),
              if (!isCompact) ...[
                const SizedBox(height: 12),
                _buildFooter(theme),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        // Provider avatar/logo
        CircleAvatar(
          radius: 20,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          child: _buildProviderInitial(theme),
        ),
        const SizedBox(width: 12),

        // Provider info and match score
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      scholarship.provider,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildMatchScore(theme),
                ],
              ),
              Text(
                '${scholarship.countryFlag} ${scholarship.providerCountry}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        // Action menu
        IconButton(
          onPressed: () => _showActionSheet(theme),
          icon: Icon(
            Icons.more_vert,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildProviderInitial(ThemeData theme) {
    return Text(
      scholarship.provider.isNotEmpty
          ? scholarship.provider[0].toUpperCase()
          : '?',
      style: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMatchScore(ThemeData theme) {
    final score = (scholarship.matchScore * 100).round();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getMatchScoreColor(scholarship.matchScore),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 14, color: Colors.white),
          const SizedBox(width: 2),
          Text(
            '$score% Match',
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMatchScoreColor(double score) {
    if (score >= 0.8) return Colors.green;
    if (score >= 0.6) return Colors.orange;
    return Colors.grey;
  }

  Widget _buildContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          scholarship.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 12),

        // Key details chips
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            _buildInfoChip(
              theme,
              scholarship.fundingType,
              Icons.monetization_on,
              Colors.green,
            ),
            _buildInfoChip(
              theme,
              scholarship.degreeLevel,
              Icons.school,
              Colors.blue,
            ),
            _buildInfoChip(
              theme,
              scholarship.deadlineFormatted,
              Icons.schedule,
              _getDeadlineColor(scholarship.urgencyLevel),
            ),
            if (scholarship.quickTags.isNotEmpty)
              ...scholarship.quickTags
                  .take(2)
                  .map(
                    (tag) =>
                        _buildInfoChip(theme, tag, Icons.label, Colors.purple),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChip(
    ThemeData theme,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Row(
      children: [
        // Engagement actions (like Instagram)
        Expanded(
          child: Row(
            children: [
              _buildActionButton(
                theme,
                scholarship.isSaved ? Icons.bookmark : Icons.bookmark_border,
                scholarship.isSaved ? 'Saved' : 'Save',
                onSave,
                isActive: scholarship.isSaved,
              ),
              const SizedBox(width: 16),
              _buildActionButton(theme, Icons.share_outlined, 'Share', onShare),
              const SizedBox(width: 16),
              _buildActionButton(theme, Icons.info_outline, 'Details', onTap),
            ],
          ),
        ),

        // Apply button
        ElevatedButton(
          onPressed: () => _handleApply(),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Apply',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    ThemeData theme,
    IconData icon,
    String label,
    VoidCallback? onPressed, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: isActive
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getDeadlineColor(DeadlineUrgency urgency) {
    switch (urgency) {
      case DeadlineUrgency.passed:
        return Colors.red;
      case DeadlineUrgency.urgent:
        return Colors.red;
      case DeadlineUrgency.soon:
        return Colors.orange;
      case DeadlineUrgency.normal:
        return Colors.green;
    }
  }

  void _showActionSheet(ThemeData theme) {
    // TODO: Implement action sheet for more options
  }

  void _handleApply() {
    // TODO: Implement apply action
  }
}
