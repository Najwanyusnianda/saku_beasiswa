import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saku_beasiswa/core/config/app_router.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// --- State Management ---
// Provider to hold the current page index
final onboardingPageIndexProvider = StateProvider<int>((ref) => 0);

// Data class for our onboarding content
class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// --- UI ---
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  // The content for our onboarding slides
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      imagePath: 'assets/images/onboarding_1.png',
      title: 'Never miss a deadline',
      description: 'We track scholarship deadlines so you can focus on what matters.',
    ),
    OnboardingItem(
      imagePath: 'assets/images/onboarding_2.png',
      title: 'Smart templates',
      description: 'Let our smart templates do the heavy lifting for your applications.',
    ),
    OnboardingItem(
      imagePath: 'assets/images/onboarding_3.png',
      title: 'Your personal assistant',
      description: 'Your scholarship journey, guided and simplified from start to finish.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(onboardingPageIndexProvider);
    final isLastPage = currentPageIndex == _onboardingItems.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top 'Skip' button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the next screen using GoRouter
                  print('Skipping onboarding');
                  context.go('/profile-setup');
                },
                child: const Text('Skip'),
              ),
            ),
            // PageView for the slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (index) {
                  // Update the state provider when page changes
                  ref.read(onboardingPageIndexProvider.notifier).state = index;
                },
                itemBuilder: (context, index) {
                  final item = _onboardingItems[index];
                  return OnboardingPageView(
                    imagePath: item.imagePath,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),
            // Bottom controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingItems.length,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.outline,
                    ),
                  ),
                  
                  // Next/Get Started Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      if (isLastPage) {
                        print('Onboarding complete, navigating to profile setup');
                        context.go('/profile-setup');
                        
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(
                      isLastPage ? Icons.check_rounded : Icons.arrow_forward_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
