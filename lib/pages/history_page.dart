import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/pages/mobile/history_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/history_widescreen_page.dart';


class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updatelayout(constraints);

          return Obx(
            () => controller.isMobile.value
                ? HistoryMobilePage()
                : HistoryWidescreenPage(),
          );
        },
      ),
    );
  }
}