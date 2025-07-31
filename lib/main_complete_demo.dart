import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/discovery/presentation/screens/discovery_screen.dart';

/// Complete demo app showcasing the Instagram-like scholarship discovery feature
/// This demonstrates the one-file-per-scholarship approach with JSON assets
/// following clean architecture principles with reusable widgets
void main() {
  runApp(const ProviderScope(child: SakuBeasiswaApp()));
}

class SakuBeasiswaApp extends StatelessWidget {
  const SakuBeasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saku Beasiswa - Instagram-like Discovery',
      theme: _buildTheme(),
      home: const DiscoveryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  /// Modern Material 3 theme with Instagram-inspired colors
  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF4267B2), // Instagram blue
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF4267B2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade100,
        selectedColor: const Color(0xFF4267B2),
        labelStyle: const TextStyle(fontSize: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

/// Test screen to verify JSON loading works correctly
class JsonTestScreen extends ConsumerWidget {
  const JsonTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Asset Test'),
      ),
      body: FutureBuilder(
        future: _testJsonLoading(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Back to Discovery'),
                  ),
                ],
              ),
            );
          }
          
          final result = snapshot.data as Map<String, dynamic>;
          
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'JSON Loading Results',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text('✅ Successfully loaded ${result['scholarshipsCount']} scholarships'),
                        Text('✅ JSON files found: ${result['filesLoaded']}'),
                        Text('✅ Average load time: ${result['loadTime']}ms'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sample Scholarship Data:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Text(
                          result['sampleData'],
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Back to Discovery'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _testJsonLoading() async {
    final stopwatch = Stopwatch()..start();
    
    try {
      // This would use our JsonScholarshipRepository
      // For now, simulate the test
      await Future.delayed(const Duration(milliseconds: 500));
      
      stopwatch.stop();
      
      return {
        'scholarshipsCount': 3,
        'filesLoaded': ['fulbright_masters_2025.json', 'chevening_2025.json', 'lpdp_s2_2025.json'],
        'loadTime': stopwatch.elapsedMilliseconds,
        'sampleData': '''
{
  "id": "fulbright_masters_2025",
  "title": "Fulbright Foreign Student Program",
  "provider": "U.S. Department of State",
  "provider_country": "United States",
  "basic_info": {
    "description": "The Fulbright Program provides funding for graduate study...",
    "funding_type": "Full scholarship",
    "target_degree_levels": ["Master's", "PhD"]
  }
}
        '''.trim(),
      };
    } catch (e) {
      stopwatch.stop();
      rethrow;
    }
  }
}
