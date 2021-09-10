import 'package:desafio/core/app_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<AppController>(AppController(), permanent: true);
  }
}
