import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/auth/widget/primary_button.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Text(''),
              const Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/Logo.png',
                  color: Color(0xFF5E17EB),
                  width: 200,
                  height: 200,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Login',
                type: ButtonType.outlined,
                borderColor: Colors.purple,
                textColor: Colors.black,
                onPressed: () {
                  print('Outlined button clicked');
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign Up',
                type: ButtonType.filled,
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                onPressed: () {
                  print('Filled button clicked');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
