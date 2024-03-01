import 'package:flutter_demo/application/services/scan_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }

}