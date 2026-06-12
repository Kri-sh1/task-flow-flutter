import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter_application_1/core/theme/app_text_styles.dart';
import 'package:practice_flutter_application_1/pages/landing_page.dart';
import 'package:practice_flutter_application_1/routes/app_routes_constants.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_button.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    "Welcome Back 👋",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1,
                  ),
        
                  const Text(
                    "Continue your journey",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),
        
                  const SizedBox(height: 25),
        
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
        
                  const SizedBox(height: 12),
        
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: const Text("Forgot Password?"),
                    ),
                  ),
        
                  const SizedBox(height: 20),
        
                  CustomButton(
                    width: 220,
                    text: 'Login',
                    onPressed: () {
                      context.go(AppRoutesConstants.dashboardPage);
                    },
                  ),
        
                  const SizedBox(height: 10),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("No account?"),
                      TextButton(
                        onPressed: () {
                          context.push(
                            AppRoutesConstants.registerationPage,
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent
                        ),
                        child: const Text("Sign Up"),
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