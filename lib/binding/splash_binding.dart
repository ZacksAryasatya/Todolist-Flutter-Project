import 'package:get/get.dart';
import 'package:todolist_application/controllers/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(()=>SplashController());
  }
  
}