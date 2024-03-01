import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/scan_controller.dart';
import 'package:get/get.dart';

import 'camera_viewer.dart';

class CameraScreen extends GetView<ScanController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CameraViewer()
      ],
    );
  }
}

