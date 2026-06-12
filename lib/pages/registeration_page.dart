import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter_application_1/core/theme/app_text_styles.dart';
import 'package:practice_flutter_application_1/pages/landing_page.dart';
import 'package:practice_flutter_application_1/routes/app_routes_constants.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_button.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_textfield.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
        
                  const AppName(),
        
                  const SizedBox(height: 15),
        
                  const Text(
                    "Create Account 🚀",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1,
                  ),
        
                  const Text(
                    "Start your journey",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),
        
                  const SizedBox(height: 25),
        
                  const CustomTextField(
                    label: "Name",
                    hintText: "Enter Your Full Name",
                    suffixIcon: Icon(Icons.person_outlined),
                  ),

                  const SizedBox(height: 16),

                  const CustomTextField(
                    label: "Email",
                    hintText: "Enter Your Email",
                    suffixIcon: Icon(Icons.email_outlined),
                  ),

                  const SizedBox(height: 16),
        
                  const CustomTextField(
                    label: "Password",
                    hintText: "Enter your Password",
                    suffixIcon: Icon(Icons.password_outlined),
                  ),

                  const SizedBox(height: 16),
        
                  const CustomTextField(
                    label: "Confirm Password",
                    hintText: "Enter your Password again",
                    suffixIcon: Icon(Icons.lock_outline),
                  ),
        
                  const SizedBox(height: 30),
        
                  CustomButton(
                    width: 220,
                    text: 'Create Account',
                    onPressed: () {
                      context.go(AppRoutesConstants.dashboardPage);
                    },
                  ),
        
                  const SizedBox(height: 10),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a user?"),
                      TextButton(
                        onPressed: () {
                          context.push(
                            AppRoutesConstants.loginPage,
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent
                        ),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}