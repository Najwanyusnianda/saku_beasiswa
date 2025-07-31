import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/profile_service.dart';
import '../widgets/profile_setup/profile_header_section.dart';
import '../widgets/profile_setup/quick_stats_card.dart';
import '../widgets/profile_setup/academic_profile_card.dart';
import '../widgets/profile_setup/test_scores_card.dart';
import '../widgets/profile_setup/settings_card.dart';

class ProfileSetupScreen extends ConsumerWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header with profile info
          ProfileHeaderSection(profileAsync: profileAsync),

          // Main content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Stats Card
                  const QuickStatsCard(),
                  const SizedBox(height: 16),

                  // Academic Profile Card
                  AcademicProfileCard(profileAsync: profileAsync),
                  const SizedBox(height: 16),

                  // Test Scores Card
                  const TestScoresCard(),
                  const SizedBox(height: 16),

                  // Settings & More Card
                  const SettingsCard(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
