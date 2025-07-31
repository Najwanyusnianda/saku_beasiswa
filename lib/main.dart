// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/navigation/app_router.dart';
import 'package:saku_beasiswa/core/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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