
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/pages/mobile/login_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/login_widescreen_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updatelayout(constraints);

          return Obx(
            () => controller.isMobile.value
                ? LoginMobilePage()
                : LoginWidescreenPage(),
          );
        },
      ),
    );
  }
}
