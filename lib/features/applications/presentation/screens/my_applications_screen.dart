// lib/features/applications/presentation/screens/my_applications_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/application_list_item.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MyApplicationsScreen extends ConsumerWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAppsAsync = ref.watch(myApplicationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Applications',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      // --- THE MAIN LOGIC CHANGE IS HERE ---
      // We use the `when` block to decide what to show in BOTH the body and the FAB slot.
      body: myAppsAsync.when(
        data: (apps) {
          // If the list is empty, return the Empty State widget.
          if (apps.isEmpty) {
            return const _EmptyState();
          }
          // If the list has data, return the ListView.
          return const _ApplicationList();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
      ),
      // The FAB is now also conditional.
      floatingActionButton: myAppsAsync.when(
        // Only show the FAB if we have data AND the list is not empty.
        data: (apps) => apps.isEmpty ? null : const _NewApplicationFAB(),
        // Don't show the FAB during loading or on error.
        loading: () => null,
        error: (_, __) => null,
      ),
    );
  }
}

// --- NEW WIDGET: Floating Action Button ---
// Extracted for cleanliness.
class _NewApplicationFAB extends StatelessWidget {
  const _NewApplicationFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.go('/templates'),
      // Using the improved label and a consistent icon
      label: const Text('New Plan'),
      icon: const Icon(Iconsax.add),
    );
  }
}

// --- NEW WIDGET: The list of applications ---
// Extracted for cleanliness and to easily watch the provider again.
class _ApplicationList extends ConsumerWidget {
  const _ApplicationList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We re-watch the provider here. Riverpod is smart and will use the cached data.
    final apps = ref.watch(myApplicationsProvider).value ?? [];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 88), // Increased bottom padding for FAB
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final item = apps[index];
        return ApplicationListItem(
          item: item,
          onTap: () {
            context.go('/applications/${item.application.id}');
          },
        );
      },
    );
  }
}

// --- NEW WIDGET: The empty state UI ---
// Extracted for cleanliness.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Iconsax.document, size: 64, color: Colors.grey),
            const SizedBox(height: 24),
            Text(
              'Your application list is empty.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Start your journey by creating a plan from a template.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/templates'),
              icon: const Icon(Iconsax.add),
              label: const Text('Start Planning with a Template'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}