//lib/core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/profile/presentation/screens/profile_setup_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/test_scores_screen.dart';
import '../widgets/placeholder_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'profile',
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: '/test-scores',
        name: 'test-scores',
        builder: (context, state) => const TestScoresScreen(),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const PlaceholderScreen(
          title: 'Settings',
          message: 'Settings feature coming soon!',
        ),
      ),
      GoRoute(
        path: '/help',
        name: 'help',
        builder: (context, state) => const PlaceholderScreen(
          title: 'Help & Support',
          message: 'Help & Support feature coming soon!',
        ),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (context, state) => const PlaceholderScreen(
          title: 'About',
          message: 'About feature coming soon!',
        ),
      ),
    ],
  );
}
