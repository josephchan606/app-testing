
import 'package:get/instance_manager.dart';
import 'package:test_job/ui/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
