import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/core/routes/route_name.dart';
import 'package:flutter_application_5/presentation/auth/widget/custom_textfield.dart';
import 'package:flutter_application_5/presentation/auth/widget/primary_button.dart';

class CreateSellerAccount extends StatefulWidget {
  CreateSellerAccount({super.key});

  @override
  State<CreateSellerAccount> createState() => _CreateSellerAccountState();
}

class _CreateSellerAccountState extends State<CreateSellerAccount> {
  String selectedAccountType = 'seller';

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Seller',
                        onPressed: () {
                          setState(() {
                            selectedAccountType = 'seller';
                          });
                        },
                        type: ButtonType.outlined,
                        borderColor: selectedAccountType == 'seller'
                            ? ColorManager.primary
                            : ColorManager.black12,
                        textColor: selectedAccountType == 'seller'
                            ? ColorManager.primary
                            : ColorManager.black12,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: 'buyers',
                        onPressed: () {
                          setState(() {
                            selectedAccountType = 'buyers';
                          });
                        },
                        type: ButtonType.outlined,
                        borderColor: selectedAccountType == 'buyers'
                            ? ColorManager.primary
                            : ColorManager.black12,
                        textColor: selectedAccountType == 'buyers'
                            ? ColorManager.primary
                            : ColorManager.black12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Name',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: emailController,
                  hintText: 'your email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),

                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Your password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
                ),
                SizedBox(height: 10),

                const SizedBox(height: 18),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.CreateProfileScreen);
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Google',
                        onPressed: () {},
                        type: ButtonType.outlined,
                        borderColor: ColorManager.black12,
                        textColor: ColorManager.black54,
                        icon: Image.asset(
                          ImageManager.google,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: 'Facebook',
                        onPressed: () {},
                        type: ButtonType.outlined,
                        borderColor: ColorManager.black12,
                        textColor: ColorManager.black54,
                        icon: Image.asset(
                          ImageManager.facebook,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.LoginSignupScreen,
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: ColorManager.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
