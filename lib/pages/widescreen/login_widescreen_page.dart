import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:todolist_application/reusable_component/card_widget.dart';
import 'package:todolist_application/reusable_component/textfield_widget.dart';

class LoginWidescreenPage extends StatelessWidget {
  LoginWidescreenPage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/clipboard.jpg",
                        width: 300,
                        height: 300,
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Ready to check off today's tasks? Let's go!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 28),
                            CustomTextField(
                              hintText: "Enter your email",
                              label: "Email",
                              icon: Icons.email,
                              controller: authController.emailController,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: "Enter your password",
                              label: "Password",
                              icon: Icons.lock,
                              isPassword: true,
                              controller: authController.passwordController,
                            ),
                            const SizedBox(height: 30),
                            Frame4Button(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
