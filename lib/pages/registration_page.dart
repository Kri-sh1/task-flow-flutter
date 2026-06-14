import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter_application_1/core/theme/app_text_styles.dart';
import 'package:practice_flutter_application_1/pages/landing_page.dart';
import 'package:practice_flutter_application_1/routes/app_routes_constants.dart';
import 'package:practice_flutter_application_1/services/auth_services.dart';
import 'package:practice_flutter_application_1/shared/utils/app_toast.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_button.dart';
import 'package:practice_flutter_application_1/shared/widgets/custom_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isLoading = false;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final AuthServices _authServices = AuthServices();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    // if (isLoading) return;

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String message = 'Something went wrong.';

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      AppToast.error("Please fill all fields");
      return;
    }

    if (password != confirmPassword) {
      AppToast.error("Password and Confirm Password do not match");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _authServices.signUp(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

      if (mounted) {
        AppToast.success('Account created successfully');
        context.go(AppRoutesConstants.dashboardPage);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            message = 'This email is already registered.';
            break;
          case 'weak-password':
            message = 'Password should be at least 6 characters.';
            break;
          case 'invalid-email':
            message = 'Please enter a valid email.';
            break;
          default:
            message = e.message ?? 'Something went wrong.';
        }
      }
      if (mounted) {
        AppToast.error(message);
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

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

                  CustomTextField(
                    controller: nameController,
                    label: "Name",
                    hintText: "Enter Your Full Name",
                    suffixIcon: const Icon(Icons.person_outlined),
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    label: "Email",
                    hintText: "Enter Your Email",
                    suffixIcon: const Icon(Icons.email_outlined),
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    hintText: "Enter your Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    obscureText: !isPasswordVisible,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    hintText: "Enter your Password again",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    obscureText: !isConfirmPasswordVisible,
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    isLoading: isLoading,
                    width: 220,
                    text: 'Create Account',
                    onPressed: signUp,
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a user?"),
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutesConstants.loginPage);
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
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
