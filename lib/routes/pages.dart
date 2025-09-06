
import 'package:todolist_application/pages/addtodo_page.dart';
import 'package:todolist_application/pages/dashboard_page.dart';
import 'package:todolist_application/pages/history_page.dart';
import 'package:todolist_application/pages/Home_page.dart';
import 'package:todolist_application/pages/login_page.dart';
import 'package:todolist_application/pages/Profile_page.dart';
import 'package:todolist_application/pages/welcoming_page.dart';
import 'package:todolist_application/routes/routes.dart';
import 'package:get/get.dart';
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomingPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),

      ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
 
    ),
    GetPage(
      name: AppRoutes.home, 
      page: () => HomePage(),
  
      ),
    GetPage(
      name: AppRoutes.addtodo, 
      page: () => AddtodoPage()),


    GetPage(
      name: AppRoutes.history,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
    ),
  ];
  
}