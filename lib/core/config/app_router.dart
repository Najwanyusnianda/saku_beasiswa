import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/widgets/main_app_shell.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:saku_beasiswa/features/applications/presentation/screens/application_detail_screen.dart';
import 'package:saku_beasiswa/features/applications/presentation/screens/my_applications_screen.dart';
import 'package:saku_beasiswa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:saku_beasiswa/features/profile/presentation/screens/profile_setup_screen.dart';
import 'package:saku_beasiswa/features/templates/presentation/screens/template_browser_screen.dart';
import 'package:saku_beasiswa/features/templates/presentation/screens/template_sync_screen.dart';

part 'app_router.g.dart';

// Placeholder for other main screens
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Placeholder for $title'),
      ),
    );
  }
}

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  // TODO: Add logic to check if onboarding is complete
  const bool isOnboardingComplete = true; // We'll make this dynamic later

  return GoRouter(
    initialLocation: isOnboardingComplete ? '/dashboard' : '/onboarding',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Routes outside the main app shell (like onboarding)
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/profile-setup',
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: '/template-sync',
        builder: (context, state) => const TemplateSyncScreen(),
      ),

      // Main application routes with a persistent bottom navigation bar
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainAppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/templates',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TemplateBrowserScreen(),
            ),
          ),
          GoRoute(
            path: '/applications',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MyApplicationsScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ApplicationDetailScreen(applicationId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PlaceholderScreen(title: 'User Profile'),
            ),
          ),
        ],
      )
    ],
  );
}