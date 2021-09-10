import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(
      LoginController(),
    );
  }
}
