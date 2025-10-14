import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_application/routes/routes.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    await Future.delayed(Duration(seconds: 2)); 
      final prefs = await SharedPreferences.getInstance();
      final savedUsername = prefs.getString('username');
      if(savedUsername != null){
        Get.offAllNamed(AppRoutes.dashboard);
      }else{
        Get.offAllNamed(AppRoutes.login);
      }
    }
}