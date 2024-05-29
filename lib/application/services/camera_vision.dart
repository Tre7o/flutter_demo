import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/conversion_record.dart';
import 'package:flutter_demo/presentation/widgets/loading.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:wakelock/wakelock.dart';
import 'package:get/get.dart';

class CameraVision extends StatefulWidget {
  const CameraVision({super.key});

  @override
  State<CameraVision> createState() => _CameraVisionState();
}

class _CameraVisionState extends State<CameraVision> {
  // final RxBool _isInitialized = RxBool(false);

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  late CameraImage cameraImage;
  late ConversionRecord conversionRecord;

  late List<Map<String, dynamic>> yoloResults;

  FlutterVision vision = FlutterVision();

  String recognizedLabel = '';
  bool isLoaded = false;
  bool isDetecting = false;

  final FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    init();
  }

  init() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        loadModel().then((value) {
          setState(() {
            isLoaded = true;
            isDetecting = false;
            yoloResults = [];
          });
        });
      }
    });
  }

  Future<void> loadModel() async {
    try {
      await vision.loadYoloModel(
          labels: 'assets/labels.txt',
          modelPath: 'assets/sign_model.tflite',
          modelVersion: "yolov8",
          numThreads: 2,
          useGpu: false);
      setState(() {
        isLoaded = true;
      });
    } on Exception catch (e) {
      // TODO
      e.printError();
    }
  }

  Future<void> objectDetection(CameraImage cameraImage) async {
    final result = await vision.yoloOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        iouThreshold: 0.4,
        confThreshold: 0.4,
        classThreshold: 0.5);
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
        recognizedLabel = yoloResults[0]['tag'];
      });
      print(yoloResults[0]['tag']);
    }
  }

  Future<void> startDetection() async {
    setState(() {
      isDetecting = true;
    });
    if (_cameraController.value.isStreamingImages) {
      return;
    }
    await _cameraController.startImageStream((image) async {
      if (isDetecting) {
        cameraImage = image;
        objectDetection(image);
      }
    });
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width / (cameraImage.height);
    double factorY = screen.height / (cameraImage.width);

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      return Positioned(
        left: result["box"][0] * factorX,
        top: result["box"][1] * factorY,
        width: (result["box"][2] - result["box"][0]) * factorX,
        height: (result["box"][3] - result["box"][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    Wakelock.disable();
    _cameraController.dispose();
    super.dispose();
  }

  void initTTS() {
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);

        print(_voices);
        setState(() {
          _voices =
              _voices.where((voice) => voice["name"].contains("en")).toList();
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (!isLoaded) {
      return const Loading();
    }
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: Get.height - 260,
                width: Get.width,
                child: CameraPreview(
                  _cameraController,
                )),
            ...displayBoxesAroundRecognizedObjects(size),
            Positioned(
              bottom: 70,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 5, color: Colors.white, style: BorderStyle.solid),
                ),
                child: isDetecting
                    ? IconButton(
                        onPressed: () async {
                          stopDetection();
                        },
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.red,
                        ),
                        iconSize: 50,
                      )
                    : IconButton(
                        onPressed: () async {
                          await startDetection();
                        },
                        icon: const Icon(
                          Icons.circle,
                          color: Colors.white,
                        ),
                        iconSize: 50,
                      ),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            child: Text(recognizedLabel)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _flutterTts.speak(recognizedLabel);
                },
                child: const Icon(Icons.speaker),
              ),
            ],
          ),
        )
      ],
    );
  }
}
