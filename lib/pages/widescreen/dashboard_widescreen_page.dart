import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/dashboard_controller.dart';

class DashboardWidescreenPage extends StatelessWidget {
  DashboardWidescreenPage({super.key});

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  final List<IconData> navIcons = const [
    Icons.home,
    Icons.history,
    Icons.person,
  ];

  final List<String> navLabels = const [
    "Home",
    "History",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 800;

        return Obx(
          () => Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isWide ? 220 : 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE94057),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            const Icon(Icons.task_alt, color: Colors.white, size: 40),
                            if (isWide)
                              const SizedBox(height: 8),
                            if (isWide)
                              const Text(
                                "ToDoList",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView.builder(
                          itemCount: navLabels.length,
                          itemBuilder: (context, index) {
                            final isSelected =
                                dashboardController.selectedIndex.value == index;
                            return InkWell(
                              onTap: () => dashboardController.changetabIndex(index),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withOpacity(0.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: isWide
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      navIcons[index],
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    if (isWide)
                                      const SizedBox(width: 12),
                                    if (isWide)
                                      Text(
                                        navLabels[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            const Divider(color: Colors.white54, indent: 20, endIndent: 20),
                            IconButton(
                              icon: const Icon(Icons.logout, color: Colors.white),
                              onPressed: () {
                              },
                            ),
                            if (isWide)
                              const Text(
                                "Logout",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: pages[dashboardController.selectedIndex.value],),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
