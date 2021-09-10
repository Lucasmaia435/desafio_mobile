import 'package:desafio/screens/map/map_controller.dart';
import 'package:get/get.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MapController(),
    );
  }
}
