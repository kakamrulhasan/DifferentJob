import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/auth/widget/custom_textfield.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            const Text(
              'Password',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: const Icon(
                Icons.visibility,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
