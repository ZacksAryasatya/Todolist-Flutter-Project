import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/dashboard_controller.dart';

class DashboardMobilePage extends StatelessWidget {
  DashboardMobilePage({super.key});
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              currentIndex: dashboardController.selectedIndex.value,
              onTap: dashboardController.changetabIndex,
              backgroundColor: const Color(0xFFFFFFFF),
              selectedItemColor: Color(0xFF2569EB),
              unselectedItemColor: Color(0xFF9CA3AF),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
