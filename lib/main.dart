// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/config/app_router.dart';
import 'package:saku_beasiswa/core/constants/app_theme.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Create a provider container to access providers before runApp
  final container = ProviderContainer();
  
  // Initialize the notification service
  //await container.read(notificationServiceProvider).init();
  
  runApp(
    // We use UncontrolledProviderScope to pass the pre-initialized container
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

// Extend from ConsumerWidget to access providers
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider
    final router = ref.watch(goRouterProvider);
    
    // Use MaterialApp.router to integrate GoRouter
    return MaterialApp.router(
      title: 'Saku Beasiswa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // Pass the router configuration
      routerConfig: router,
    );
  }
}