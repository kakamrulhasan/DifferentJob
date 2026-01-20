import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constansts/color_manager.dart';
import '../../viewmodel/edit_model_provider.dart';

class InfoView extends ConsumerWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(profileEditModeProvider);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        _infoCard(
          title: "Bio",
          isEditing: isEditing,
          content: Text(
            "I am a graphic designer based in Austin, TX, specializing in logo creation and branding. I love creating innovative designs that truly represent a business's identity.",
            style: TextStyle(
              color: Colors.grey[600],
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 15),

        _infoCard(
          title: "Experience",
          isEditing: isEditing,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _skillTag("Photoshop", isEditing),
                  _skillTag("Figma", isEditing),
                  _skillTag("Illustrator", isEditing),
                  _skillTag("Canva", isEditing),
                  _skillTag("UI/UX Design", isEditing),
                  _skillTag("Blen", isEditing),
                ],
              ),
              if (isEditing) ...[
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add ",
                          style: TextStyle(color: ColorManager.white),
                        ),
                        Icon(Icons.add, color: ColorManager.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 15),

        // CONTACT CARD
        _infoCard(
          title: "Contact Us",
          isEditing: isEditing,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _contactRow("Phone Number:", "+99125 456 789"),
              const SizedBox(height: 10),
              _contactRow("Email Address:", "kathben@gmail.com"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoCard({
    required String title,
    required Widget content,
    required bool isEditing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              if (isEditing)
                const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 15),
          content,
        ],
      ),
    );
  }

  Widget _skillTag(String label, bool isEditing) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorManager.black10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: ColorManager.black54,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isEditing) ...[
            const SizedBox(width: 8),
            Container(
              width: 16, 
              height: 16, 
              decoration: BoxDecoration(
                color: ColorManager.white, 
                shape: BoxShape.circle, 
              ),
              child: const Icon(
                Icons.close,
                size: 12, 
                color: ColorManager.black, 
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _contactRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        children: [
          TextSpan(text: "$label "),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: ColorManager.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
