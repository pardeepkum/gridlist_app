import 'package:get/get.dart';
import 'package:grid_app/app/controller/number_controller.dart';

class NumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NumberController());
  }
}
