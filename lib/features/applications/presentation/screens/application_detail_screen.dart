import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/overview_tab.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/requirements_tab.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/timeline_tab.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/notes_tab.dart';

// Make it a ConsumerStatefulWidget
class ApplicationDetailScreen extends ConsumerStatefulWidget {
  final String applicationId;
  const ApplicationDetailScreen({super.key, required this.applicationId});

  @override
  ConsumerState<ApplicationDetailScreen> createState() => _ApplicationDetailScreenState();
}

class _ApplicationDetailScreenState extends ConsumerState<ApplicationDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final int _applicationIdAsInt;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _applicationIdAsInt = int.parse(widget.applicationId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider to get the application name for the AppBar title
    final applicationAsync = ref.watch(applicationDetailProvider(_applicationIdAsInt));

    return Scaffold(
      appBar: AppBar(
        // Use the provider data for a dynamic title
        title: applicationAsync.when(
          data: (app) => Text(app.template.name, overflow: TextOverflow.ellipsis),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Application Detail'),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Requirements'),
            Tab(text: 'Timeline'),
            Tab(text: 'Notes'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Use our new OverviewTab widget, passing the ID
          OverviewTab(applicationId: _applicationIdAsInt),

          // Placeholders for other tabs
          RequirementsTab(applicationId: _applicationIdAsInt),
          TimelineTab(applicationId: _applicationIdAsInt),
          NotesTab(applicationId: _applicationIdAsInt),
        ],
      ),
    );
  }
}
