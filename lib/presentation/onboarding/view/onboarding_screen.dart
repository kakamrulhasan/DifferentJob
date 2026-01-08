import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/routes/route_name.dart';

import '../viewmodel/onboarding_viewmodel.dart';
import 'onboarding_page.dart';
import 'onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingViewModel vm = OnboardingViewModel();

  void _onPageChanged(int index) {
    setState(() {
      vm.currentIndex = index;
    });
  }

  void _next() {
    if (!vm.isLastPage) {
      vm.controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteName.LoginSignupScreen);
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, RouteName.LoginSignupScreen);
  }

  @override
  void dispose() {
    vm.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// Main content
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: vm.controller,
                    itemCount: vm.pages.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (_, index) {
                      return OnboardingPage(item: vm.pages[index]);
                    },
                  ),
                ),

                /// Dot indicator
                OnboardingIndicator(
                  count: vm.pages.length,
                  currentIndex: vm.currentIndex,
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.all(18),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5E17EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vm.isLastPage ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Skip button (ON TOP)
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: _skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
