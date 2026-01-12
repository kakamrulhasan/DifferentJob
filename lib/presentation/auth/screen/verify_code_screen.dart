import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/widgets/primary_button.dart';
import '../../../core/constansts/color_manager.dart';
import '../../../core/resource/app_strings.dart';
import '../widget/otp_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerificationNumberScreenState();
}

class _VerificationNumberScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 35),

              const Text(
                'Verify Your Code',
                style: TextStyle(
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Text(
                AppStrings.verifyCode,
                style: TextStyle(color: ColorManager.black, fontSize: 16),
              ),

              const SizedBox(height: 30),

              const OtpScreen(),

              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Resend: ",
                    style: TextStyle(color: ColorManager.black, fontSize: 18),
                  ),
                  const Text(
                    '59s',
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't receive OTP?",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Resend Code',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorManager.primary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Verify',
                onPressed: () {
                  //Navigator.pushNamed(context, RouteName.CreateSellerAccount);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
