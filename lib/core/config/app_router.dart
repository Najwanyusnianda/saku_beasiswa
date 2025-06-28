//lib/core/config/app_router.dart
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
import 'package:saku_beasiswa/features/templates/presentation/screens/template_detail_screen.dart';
import 'package:saku_beasiswa/features/templates/presentation/screens/customise_template_wizard_screen.dart';
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
  const bool isOnboardingComplete = true; 

  return GoRouter(
    initialLocation: isOnboardingComplete ? '/dashboard' : '/onboarding',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // --- NON-SHELL ROUTES ---
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

      // --- NEW: Template routes are now outside the shell ---
      // This makes them present as normal full-screen pages.
      GoRoute(
        path: '/templates',
        builder: (context, state) => const TemplateBrowserScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return TemplateDetailScreen(templateId: id);
            },
            routes: [
              GoRoute(
                path: 'customise',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return CustomiseTemplateWizardScreen(templateId: id);
                },
              ),
            ],
          ),
        ],
      ),

      // --- SHELL ROUTES (with BottomNavigationBar) ---
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainAppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(child: DashboardScreen()),
          ),
          // '/templates' route has been REMOVED from here.
          GoRoute(
            path: '/applications', // Now at index 1
            pageBuilder: (context, state) => const NoTransitionPage(child: MyApplicationsScreen()),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return ApplicationDetailScreen(applicationId: id);
                },
              ),
            ],
          ),
          // NEW: Add the /feed route
          GoRoute(
            path: '/feed', // Now at index 2
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PlaceholderScreen(title: 'Feed'),
            ),
          ),
          GoRoute(
            path: '/profile', // Now at index 3
            pageBuilder: (context, state) => const NoTransitionPage(child: PlaceholderScreen(title: 'User Profile')),
          ),
        ],
      )
    ],
  );
}