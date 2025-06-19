import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/template_card.dart';

class TemplateBrowserScreen extends ConsumerWidget {
  const TemplateBrowserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(allTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover Scholarships',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: templatesAsync.when(
        data: (templates) {
          if (templates.isEmpty) {
            return const Center(child: Text('No scholarship templates found.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return TemplateCard(
                template: template,
                onAdd: () async {
                  // Call the repository method to create the application
                  await ref.read(applicationRepositoryProvider).createApplicationFromTemplate(template.id);
                  
                  // Show a confirmation message
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${template.name} added to your applications!'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
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
