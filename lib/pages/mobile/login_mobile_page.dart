import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:todolist_application/reusable_component/card_widget.dart';
import 'package:todolist_application/reusable_component/textfield_widget.dart';

class LoginMobilePage extends StatelessWidget {
  LoginMobilePage({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/kunci.png"),
                        const SizedBox(height: 13),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Ready to check off today's tasks? Let's go!",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          hintText: "Enter your email",
                          label: "Email",
                          icon: Icons.email,
                          controller: authController.emailController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: "Enter your password",
                          label: "Password",
                          icon: Icons.lock,
                          isPassword: true,
                          controller: authController.passwordController,
                        ),
                        const SizedBox(height: 24),
                        Frame4Button(
                          width: 296,
                          height: 50,
                          elevation: 4,
                          color: const Color(0xFF42B6E7),
                          text: "Login",
                          onPressed: () {
                            authController.login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
