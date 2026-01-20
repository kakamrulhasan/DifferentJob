import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/about_data_model_provider.dart';
// import 'package:flutter_application_5/core/constansts/color_manager.dart'; // Adjust this import path as needed

class AboutLocalScreen extends ConsumerWidget {
  const AboutLocalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutItems = ref.watch(aboutLocalProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          'About Local',
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
            // Loop through the items from Riverpod
            ...aboutItems
                .map((item) => _buildInfoCard(item.title, item.description))
                .toList(),

            // Special Contact Us Card
            _buildContactCard(ColorManager.primary),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description) {
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
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280), // Slightly darker grey for readability
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(Color primaryColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Have feedback or ideas? Reach out at:",
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.mail_outline, color: primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                "hello@local.app",
                style: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
