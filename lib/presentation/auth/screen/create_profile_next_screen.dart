import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/auth/widget/custom_textfield.dart';
import 'package:flutter_application_5/presentation/auth/widget/experienceInputCard.dart';
import 'package:flutter_application_5/presentation/auth/widget/primary_button.dart';

class CreateProfileNextScreen extends StatefulWidget {
  const CreateProfileNextScreen({super.key});

  @override
  State<CreateProfileNextScreen> createState() =>
      _CreateProfileNextScreenState();
}

class _CreateProfileNextScreenState extends State<CreateProfileNextScreen> {
  TextEditingController aboutController = TextEditingController();

  List<String> experiences = [
    'Photoshop',
    'Figma',
    'Illustrator',
    'Canva',
    'UI/UX Design',
    'Blender',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    'Create Your Profile',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                    'Skip',
                    style: TextStyle(color: ColorManager.black54, fontSize: 22),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              const Text(
                'Experience',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              ExperienceInputCard(
                items: experiences,
                onChanged: (list) {
                  debugPrint('Updated Experiences: $list');
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'About',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: aboutController,
                hintText: 'write some about you ....',
                maxLines: 6,
                minHeight: 56,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 40),
              CustomButton(text: 'Complete', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
