import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/todo_controller.dart';
import 'package:todolist_application/pages/mobile/home_mobile_page.dart';
import 'package:todolist_application/pages/widescreen/home_widescreen_page.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TodoController todocontroller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          todocontroller.updatelayout(constraints);

          return Obx(
            () => todocontroller.isMobile.value
                ? HomeMobilePage()
                : HomeWidescreenPage(),
          );
        },
      ),
    );
  }
}