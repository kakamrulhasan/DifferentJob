import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';

import 'package:flutter_application_5/presentation/auth/widget/custom_textfield.dart';
import 'package:flutter_application_5/presentation/auth/widget/primary_button.dart';

class SetNewPassword extends StatelessWidget {
  SetNewPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              const SizedBox(height: 60),
              const Text(
                'Set New Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'New Password',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
              ),
              const SizedBox(height: 15),

              const Text(
                'Confirm Password',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
              ),
              SizedBox(height: 10),
              const Spacer(),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  // Navigator.pushNamed(context, RouteName.VerifyCodeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
