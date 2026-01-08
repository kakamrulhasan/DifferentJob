import 'package:flutter/material.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const SizedBox(height: 40),

          Text(
            item.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Text(
            item.description,
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          Image.asset(
            item.image,
            width: 260,
            height: 260,
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
