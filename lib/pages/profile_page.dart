import 'package:flutter/material.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/reusable_component/button_widget.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  // Avatar
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF42B6E7), Color(0xFF6DD5FA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF42B6E7).withValues(alpha: 0.5),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profilimg.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Profile Info Box
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF42B6E7).withValues(alpha: 0.5),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: Color(0xFF42B6E7), width: 1.2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header dengan icon dan teks
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF42B6E7),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 18,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 26,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Profile Information',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Isi data dengan icon dan divider
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(
                                      0xFF42B6E7,
                                    ).withValues(alpha: 0.12),
                                    radius: 18,
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xFF42B6E7),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      'Nama',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text('TODO', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                height: 1,
                                color: Color(
                                  0xFF42B6E7,
                                ).withValues(alpha: 0.18),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(
                                      0xFF42B6E7,
                                    ).withValues(alpha: 0.12),
                                    radius: 18,
                                    child: Icon(
                                      Icons.school,
                                      color: Color(0xFF42B6E7),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      'Asal Sekolah',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'SMK RUS KUDUS',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                height: 1,
                                color: Color(
                                  0xFF42B6E7,
                                ).withValues(alpha: 0.18),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(
                                      0xFF42B6E7,
                                    ).withValues(alpha: 0.12),
                                    radius: 18,
                                    child: Icon(
                                      Icons.cake,
                                      color: Color(0xFF42B6E7),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      'Tanggal Lahir',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '01 Januari 2000',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                height: 1,
                                color: Color(
                                  0xFF42B6E7,
                                ).withValues(alpha: 0.18),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(
                                      0xFF42B6E7,
                                    ).withValues(alpha: 0.12),
                                    radius: 18,
                                    child: Icon(
                                      Icons.email,
                                      color: Color(0xFF42B6E7),
                                    ),
                                  ),
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'todo@gmail.com',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Frame4Button(
                    text: 'Logout',
                    onPressed: () {
                      authController.logout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
