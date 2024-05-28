import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/scan_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CaptureButton extends GetView<ScanController> {
  CaptureButton({super.key});
  int capture = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        right: Get.width / 2.5,
        child: GestureDetector(
          onTap: () {
            
          },
          child: Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ));
  }
}
