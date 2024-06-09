import 'package:get/get.dart';
import 'package:xten_project/Connectivity/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
