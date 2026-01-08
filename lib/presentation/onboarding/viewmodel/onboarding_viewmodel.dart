import 'package:flutter/material.dart';

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingViewModel {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<OnboardingItem> pages = [
    OnboardingItem(
      title: 'Find Trusted Local Help',
      description:
          'Explore handyman services, gigs,and community post right in your neighborhood',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingItem(
      title: 'Post Jobs Easily',
      description: 'Post a job and get responses from skilled people nearby',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingItem(
      title: 'Get Things Done',
      description: 'Hire quickly and get your work done with confidence',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  bool get isLastPage => currentIndex == pages.length - 1;
}
