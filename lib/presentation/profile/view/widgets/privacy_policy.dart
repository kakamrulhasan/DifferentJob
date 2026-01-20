import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/privacy_datamodel.dart';

class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final policyItems = ref.watch(privacyPolicyProvider);

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Mapping through the data from the provider
            ...policyItems.map((item) => _buildPolicyCard(item)).toList(),

            const SizedBox(height: 20),

            // Last Updated Text
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Last Updated: ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "June 2025",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for each section card
  Widget _buildPolicyCard(PrivacyPolicyItem item) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5, // Line height for better readability
            ),
          ),
        ],
      ),
    );
  }
}
