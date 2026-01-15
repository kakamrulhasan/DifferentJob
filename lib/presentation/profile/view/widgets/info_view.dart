import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _infoCard(
          title: "Bio",
          content: Text(
            "I am a graphic designer based in Austin, TX, specializing in logo creation and branding. I love creating innovative designs that truly represent a business's identity.",
            style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 14),
          ),
        ),
        const SizedBox(height: 15),
        _infoCard(
          title: "Experience",
          content: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _skillTag("Photoshop"),
              _skillTag("Figma"),
              _skillTag("Illustrator"),
              _skillTag("UI/UX Design"),
              _skillTag("Canva"),
            ],
          ),
        ),
        const SizedBox(height: 15),
        _infoCard(
          title: "Contact Us",
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

  Widget _infoCard({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 15),
          content,
        ],
      ),
    );
  }

  Widget _skillTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Color(0xFF535F70), fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }

  Widget _contactRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        children: [
          TextSpan(text: "$label "),
          TextSpan(text: value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}