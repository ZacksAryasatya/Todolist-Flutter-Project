import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/pages/mobile/dashboard_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/dashboard_widescreen_page.dart';


class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updatelayout(constraints);

          return Obx(
            () => controller.isMobile.value
                ? DashboardMobilePage()
                : DashboardWidescreenPage(),
          );
        },
      ),
    );
  }
}