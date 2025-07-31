import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:saku_beasiswa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:saku_beasiswa/features/profile/presentation/screens/profile_setup_screen.dart';

part 'app_router.g.dart';

// A placeholder screen for routes we haven't created yet.
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

// Using riverpod_generator to create a provider for our router.
// This is the best practice for accessing the router globally.
@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoute.onboarding.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true, // Set to false in production
    routes: [
      GoRoute(
        path: AppRoute.onboarding.path,
        name: AppRoute.onboarding.name,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoute.profileSetup.path,
        name: AppRoute.profileSetup.name,
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      // We will add more routes here, e.g., for the main dashboard
      // GoRoute(
      //   path: AppRoute.home.path,
      //   name: AppRoute.home.name,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
  );
}

// A class to hold all our route constants, making them type-safe and easy to use.
class AppRoute {
  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;

  static const AppRoute onboarding = AppRoute(path: '/onboarding', name: 'onboarding');
  static const AppRoute profileSetup = AppRoute(path: '/profile-setup', name: 'profileSetup');
  // static const AppRoute home = AppRoute(path: '/home', name: 'home');
}
