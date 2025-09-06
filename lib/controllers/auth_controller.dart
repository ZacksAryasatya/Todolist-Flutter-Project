import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist_application/pages/Dashboard_page.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == "z" && password == "z") {
      Get.snackbar("Sukses", "Login berhasil ");
      Get.offAll(() => DashboardPage());
    } else {
      Get.snackbar("Error", "Email atau password salah");
    }
  }

}
