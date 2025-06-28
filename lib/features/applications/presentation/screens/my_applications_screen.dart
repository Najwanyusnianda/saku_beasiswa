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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/templates'),
        label: const Text('New Application'),
        icon: const Icon(Iconsax.add),
      ),
      body: myAppsAsync.when(
        data: (apps) {
          if (apps.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.document_text, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'Your application list is empty.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Start your journey by creating a plan from a template.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/templates'),
                    icon: const Icon(Iconsax.add),
                    label: const Text('Start Planning with a Template'),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80), // Add padding for FAB
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
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
      ),
    );
  }
}
