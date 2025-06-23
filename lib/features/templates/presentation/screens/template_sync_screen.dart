//lib/features/templates/presentation/screens/template_sync_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_matching_provider.dart';
import 'package:go_router/go_router.dart';
class TemplateSyncScreen extends ConsumerWidget {
  const TemplateSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchingTemplatesAsync = ref.watch(matchingTemplatesProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        // The `when` method from AsyncValue is perfect for handling FutureProvider states.
        child: matchingTemplatesAsync.when(
          loading: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/gears_loading.json',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 24),
              Text(
                'Preparing your personalized templates...',
                style: textTheme.titleLarge?.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 8),
              Text(
                'This will only take a moment.',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          error: (err, stack) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: AppColors.error, size: 64),
                const SizedBox(height: 16),
                Text(
                  'Something went wrong',
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'We couldn\'t prepare your workspace. Please try again later.\nError: ${err.toString()}',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                // TODO: Add a "Try Again" button
              ],
            ),
          ),
          data: (templates) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_outline, color: AppColors.success, size: 80),
                const SizedBox(height: 24),
                Text(
                  'All Set!',
                  style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'We found ${templates.length} scholarship templates matching your profile.',
                  style: textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Use go() to clear the onboarding stack and start fresh
                    context.go('/dashboard');
                  },
                  child: const Text('Go to Dashboard'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
