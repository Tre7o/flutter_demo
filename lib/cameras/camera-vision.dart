import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_demo/presentation/widgets/loading.dart';

class CameraVision extends StatefulWidget {
  const CameraVision({super.key});

  @override
  State<CameraVision> createState() => _CameraVisionState();
}

class _CameraVisionState extends State<CameraVision> {

  CameraImage? cameraImage;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  String output = '';

  runModel() async {
    if (cameraImage != null) {
      var prediction = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      prediction!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height - 200,
            child: Container(
              child: !cameraController!.value.isInitialized
                  ? const Loading()
                  : AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    ),
            )
        ),
        SizedBox(
          child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)
              ),
              child: Text(output)
          ),
        )
      ],
    );
  }
}