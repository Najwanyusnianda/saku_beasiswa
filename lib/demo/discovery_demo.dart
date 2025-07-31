import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/discovery/presentation/presentation.dart';

/// Demo app to showcase the discovery feature
class DiscoveryDemoApp extends StatelessWidget {
  const DiscoveryDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Saku Beasiswa - Discovery Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const DiscoveryScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/scholarship':
              final scholarshipId = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (context) => ScholarshipDetailScreen(
                  scholarshipId: scholarshipId ?? 'demo',
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => const DiscoveryScreen(),
              );
          }
        },
      ),
    );
  }
}

/// Simple launcher for the demo
void main() {
  runApp(const DiscoveryDemoApp());
}
