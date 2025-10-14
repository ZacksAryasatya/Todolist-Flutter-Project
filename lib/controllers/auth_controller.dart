import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_application/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
     String usernameToString = emailController.text.toString().trim();
    String passwordToString = passwordController.text.toString().trim();

    if (usernameToString == "z" && passwordToString == "z") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameToString);
      Get.offNamed(AppRoutes.dashboard);
    } 
    else {
      Get.snackbar("Error", "Invalid username or password");
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(AppRoutes.login);
  }

  var isMobile = true.obs;
  void updatelayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
