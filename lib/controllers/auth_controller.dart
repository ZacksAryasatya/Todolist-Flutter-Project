import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist_application/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == "z" && password == "z") {
      Get.snackbar("Sukses", "Login berhasil ");
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar("Error", "Email atau password salah");
    }
  }
}
