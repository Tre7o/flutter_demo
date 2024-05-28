import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/capture_button.dart';
import 'package:get/get.dart';
import '../../application/services/scan_controller.dart';
import '../widgets/loading.dart';


class CameraViewer extends StatelessWidget {
  const CameraViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(builder: (controller) {
      if (!controller.isInitialized) {
        return const Loading();
      }
      return Column(
        children: [
          SizedBox(
              height: Get.height - 260,
              width: Get.width,
              child: CameraPreview(
                controller.cameraController,
                child: CaptureButton(),
              )
          ),
          SizedBox(
            child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black)
                ),
                // child: Obx(() => Text(controller.output.value)) 
            ),
          )
        ],
      );
    });
  }
}
