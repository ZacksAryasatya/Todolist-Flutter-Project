import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:todolist_application/reusable_component/card_widget.dart';
import 'package:todolist_application/reusable_component/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/kunci.png", width: 160, height: 160),

                const SizedBox(height: 13),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  icon: Icons.email,
                  controller: authController.emailController,
                ),

                const SizedBox(height: 16),
                CustomTextField(
       
                  hintText: "Enter your password",
                  icon: Icons.lock,
                  isPassword: true,
                  controller: authController.passwordController,
                ),

                const SizedBox(height: 24),
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
    );
  }
}
