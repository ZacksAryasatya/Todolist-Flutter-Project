
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/pages/mobile/login_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/login_widescreen_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.find<SwitchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateScreen(constraints);

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
