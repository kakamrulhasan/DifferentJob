import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/core/resource/app_strings.dart';

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
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingdes1,
      image: ImageManager.onboarding1,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingdes2,
      image: ImageManager.onboarding2,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingdes3,
      image: ImageManager.onboarding3,
    ),
  ];

  bool get isLastPage => currentIndex == pages.length - 1;
}
