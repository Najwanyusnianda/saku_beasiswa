import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings & More',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(
              context,
              Icons.settings,
              'Settings',
              () => context.go('/settings'),
            ),
            _buildSettingsItem(
              context,
              Icons.notifications,
              'Notifications',
              () =>
                  context.go('/settings'), // Will redirect to settings for now
            ),
            _buildSettingsItem(
              context,
              Icons.help,
              'Help & Support',
              () => context.go('/help'),
            ),
            _buildSettingsItem(
              context,
              Icons.info,
              'About',
              () => context.go('/about'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
