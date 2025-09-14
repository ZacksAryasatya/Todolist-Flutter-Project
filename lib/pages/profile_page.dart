import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/controllers/auth_controller.dart';
import 'package:todolist_application/reusable_component/profile_avatar.dart';
import 'package:todolist_application/reusable_component/profile_info_card.dart';
import 'package:todolist_application/reusable_component/profile_info_row.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                const ProfileAvatar(imagePath: 'assets/images/profilimg.png'),
                const SizedBox(height: 24),
                ProfileInfoCard(
                  children: const [
                    ProfileInfoRow(
                      icon: Icons.person,
                      label: 'Nama',
                      value: 'TODO',
                    ),
                    ProfileInfoRow(
                      icon: Icons.school,
                      label: 'Asal Sekolah',
                      value: 'SMK RUS KUDUS',
                    ),
                    ProfileInfoRow(
                      icon: Icons.cake,
                      label: 'Tanggal Lahir',
                      value: '01 Januari 2000',
                    ),
                    ProfileInfoRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'todo@gmail.com',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
