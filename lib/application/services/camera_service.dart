import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/loading.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

import '../../presentation/widgets/capture_button.dart';

class CameraService extends StatefulWidget {
  const CameraService({super.key});

  @override
  State<CameraService> createState() => _CameraServiceState();
}

class _CameraServiceState extends State<CameraService> {
  final RxBool _isInitialized = RxBool(false);

  CameraController? _cameraController;

  late List<CameraDescription> _cameras;
  late CameraImage cameraImage;

  int _imageCount = 0; // to take count of the images in the stream
  String output = "";

  Future<void> _initTensorFlow() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
        isAsset: true);
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.bgra8888); //addition
    _cameraController!.initialize().then((_) {
      _isInitialized.value = true;
      _cameraController!.startImageStream((image) {
        // cameraImage = image;
        // print(DateTime.now().millisecondsSinceEpoch);
        _imageCount++;
        if (_imageCount % 10 == 0) {
          _imageCount = 0;
          objectRecognition(image);
        }
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied access to camera');
            break;
          default:
            print('Handle other errors');
            break;
        }
      }
    });
  }

  Future<void> objectRecognition(CameraImage cameraImage) async {
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: cameraImage.planes.map((plane) {
          return plane.bytes;
        }).toList(), // required
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );
    for (var element in recognitions!) {
      if (mounted) {
        setState(() {
          output = element['label'];
        });
      }
    }
    print(output);
  }

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController!.dispose();
    // Tflite.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
    _initTensorFlow();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized.value) {
      return const Loading();
    }
    return Column(
      children: [
        SizedBox(
            height: Get.height - 300,
            width: Get.width,
            child: CameraPreview(
              _cameraController!,
              child: CaptureButton(),
            )),
        SizedBox(
          child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)),
              child: Text(output)),
        )
      ],
    );
  }
}
