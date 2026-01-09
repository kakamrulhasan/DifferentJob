import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/core/routes/route_name.dart';
import 'package:flutter_application_5/presentation/auth/widget/custom_textfield.dart';
import 'package:flutter_application_5/presentation/auth/widget/date_picker.dart';
import 'package:flutter_application_5/presentation/auth/widget/primary_button.dart';

class CreateProfileNextScreen extends StatefulWidget {
  const CreateProfileNextScreen({super.key});

  @override
  State<CreateProfileNextScreen> createState() =>
      _CreateProfileNextScreenState();
}

class _CreateProfileNextScreenState extends State<CreateProfileNextScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
                    onPressed: () {},
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
              const Text('Name', style: TextStyle(color: ColorManager.black54)),
              const SizedBox(height: 10),
              CustomTextField(controller: nameController, hintText: 'John Doe'),
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                hintText: 'demoinfo@example.com',
              ),
              const SizedBox(height: 10),
              const Text(
                'Phone',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: phoneController,
                hintText: '+1 123 432 2342',
              ),
              const SizedBox(height: 10),
              const Text(
                'Date of Birth',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              DatePicker(
                controller: birthController,
                hintText: 'Select date of birth',
                readOnly: true,
                suffixIcon: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    birthController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),

              const SizedBox(height: 10),
              const Text(
                'Location',
                style: TextStyle(color: ColorManager.black54),
              ),
              const SizedBox(height: 10),
              DatePicker(
                controller: locationController,
                hintText: 'Austina, TX',
                readOnly: true,
                suffixIcon: const Icon(Icons.location_on_outlined),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          ListTile(
                            title: const Text('Dhaka'),
                            onTap: () {
                              locationController.text = 'Dhaka';
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text('Chittagong'),
                            onTap: () {
                              locationController.text = 'Chittagong';
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text('Sylhet'),
                            onTap: () {
                              locationController.text = 'Sylhet';
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 10),
              CustomButton(
                text: 'Complete',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.CreateProfileNextScreen,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
