import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/core/routes/route_name.dart';
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
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Text(''),
              const Spacer(),
              Center(
                child: Image.asset(
                  ImageManager.splash,
                  color: ColorManager.primary,
                  width: 200,
                  height: 200,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Login',
                type: ButtonType.outlined,
                borderColor: ColorManager.primary,
                textColor: ColorManager.primary,
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.LoginScreen);
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign Up',
                type: ButtonType.filled,
                backgroundColor: ColorManager.primary,
                textColor: ColorManager.secondary,
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.CreateSellerAccount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
