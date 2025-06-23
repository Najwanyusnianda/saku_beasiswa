// lib/features/applications/presentation/screens/my_applications_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/application_list_item.dart';

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
      body: myAppsAsync.when(
        data: (apps) {
          if (apps.isEmpty) {
            return Center(
              child: Text(
                'No applications yet.\nGo to Discover to add one!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final item = apps[index];
              return ApplicationListItem(
                item: item,
                onTap: () {
                  // Navigate to the detail screen with the application ID
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
