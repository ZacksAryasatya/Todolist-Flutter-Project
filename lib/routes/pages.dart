
import 'package:todolist_application/binding/auth_binding.dart';
import 'package:todolist_application/binding/dashboard_binding.dart';
import 'package:todolist_application/binding/edit_todo_binding.dart';
import 'package:todolist_application/binding/todo_binding.dart';
import 'package:todolist_application/pages/addtodo_page.dart';
import 'package:todolist_application/pages/dashboard_page.dart';
import 'package:todolist_application/pages/edittodo_page.dart';
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
      page: () => WelcomingPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),

      ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      bindings: [DashboardBinding(), TodoBinding()],
    ),
    GetPage(
      name: AppRoutes.home, 
      page: () => HomePage(),
  
      ),
    GetPage(
      name: AppRoutes.addtodo, 
      page: () => AddTodoPage(),
     
      ),

    GetPage(
      name: AppRoutes.edittodo,
      page: () => EditTodoPage(),
      binding: EditTodoBinding(),
    ),
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