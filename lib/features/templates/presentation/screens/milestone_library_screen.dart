// lib/features/templates/presentation/screens/milestone_library_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/milestone_library_provider.dart';

class MilestoneLibraryScreen extends ConsumerWidget {
  const MilestoneLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryAsync = ref.watch(milestoneLibraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Example Milestone'),
      ),
      body: libraryAsync.when(
        data: (milestones) => ListView.builder(
          itemCount: milestones.length,
          itemBuilder: (context, index) {
            final milestone = milestones[index];
            return ListTile(
              leading: const Icon(Iconsax.document_copy),
              title: Text(milestone.name),
              subtitle: milestone.description != null ? Text(milestone.description!) : null,
              onTap: () {
                // When a milestone is tapped, pop the screen and return
                // the selected MilestoneTemplate object as the result.
                Navigator.of(context).pop(milestone);
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
