import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/dashboard_controller.dart';
import 'package:todolist_application/pages/mobile/dashboard_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/dashboard_widescreen_page.dart';


class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final DashboardController dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          dashboardController.updatelayout(constraints);

          return Obx(
            () => dashboardController.isMobile.value
                ? DashboardMobilePage()
                : DashboardWidescreenPage(),
          );
        },
      ),
    );
  }
}