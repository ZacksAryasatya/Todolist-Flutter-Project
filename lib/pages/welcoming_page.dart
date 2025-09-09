import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:todolist_application/routes/routes.dart';

class WelcomingPage extends StatelessWidget {
  const WelcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar dari assets
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF42B6E7).withValues(alpha: 0.5),
                          blurRadius: 32,
                          spreadRadius: 2,
                          offset: Offset(0, 16),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(125), 
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/gambar2.png",
                      fit: BoxFit.contain,
                      width: 250,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                "Turn your tasks into achievements.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                "Turn your tasks into achievements.\nWrite it down, check it off, and feel good every day.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 32),
              Frame4Button(
                onPressed: () {
                  Get.offNamed(
                    AppRoutes.login
                  );
                },
                text: "Get Started",
              ),
            ],
          ),
        ),
      ),
    );
  }
}