import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/dashboard_controller.dart';
import 'package:todolist_application/pages/history_page.dart';
import 'package:todolist_application/pages/home_page.dart';
import 'package:todolist_application/pages/profile_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final DashboardController dashboardController = DashboardController();
  final pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              currentIndex: dashboardController.selectedIndex.value,
              onTap: dashboardController.changetabIndex,
              backgroundColor: const Color(0xFFE94057),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black54,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
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