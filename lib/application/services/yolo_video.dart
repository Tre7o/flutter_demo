// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vision/flutter_vision.dart';
// import 'package:get/get.dart';

// class YoloVideo extends StatefulWidget {
//   const YoloVideo({Key? key}) : super(key: key);

//   @override
//   State<YoloVideo> createState() => _YoloVideoState();
// }

// class _YoloVideoState extends State<YoloVideo> {
//   late CameraController controller;
//   late List<Map<String, dynamic>> yoloResults;
//   late List<CameraDescription> cameras;

//   FlutterVision vision = FlutterVision();

//   CameraImage? cameraImage;
//   bool isLoaded = false;
//   bool isDetecting = false;

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   init() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras[0], ResolutionPreset.max);
//     controller.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         loadModel().then((value) {
//           setState(() {
//             isLoaded = true;
//             isDetecting = false;
//             yoloResults = [];
//           });
//         });
//       }
//     });
//   }

//   @override
//   void dispose() async {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     if (!isLoaded) {
//       return const Scaffold(
//         body: Center(
//           child: Text("Model not loaded, waiting for it"),
//         ),
//       );
//     }
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         AspectRatio(
//           aspectRatio: controller.value.aspectRatio,
//           child: CameraPreview(
//             controller,
//           ),
//         ),
//         ...displayBoxesAroundRecognizedObjects(size),
//         Positioned(
//           bottom: 75,
//           width: MediaQuery.of(context).size.width,
//           child: Container(
//             height: 80,
//             width: 80,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                   width: 5, color: Colors.white, style: BorderStyle.solid),
//             ),
//             child: isDetecting
//                 ? IconButton(
//                     onPressed: () async {
//                       stopDetection();
//                     },
//                     icon: const Icon(
//                       Icons.stop,
//                       color: Colors.red,
//                     ),
//                     iconSize: 50,
//                   )
//                 : IconButton(
//                     onPressed: () async {
//                       await startDetection();
//                     },
//                     icon: const Icon(
//                       Icons.circle,
//                       color: Colors.white,
//                     ),
//                     iconSize: 50,
//                   ),
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> loadModel() async {
//     try {
//       await vision.loadYoloModel(
//           labels: 'assets/labels.txt',
//           modelPath: 'assets/model_float32.tflite',
//           modelVersion: "yolov8",
//           numThreads: 2,
//           useGpu: false);
//       setState(() {
//         isLoaded = true;
//       });
//     } on Exception catch (e) {
//       // TODO
//       e.printError();
//     }
//   }

//   Future<void> objectDetection(CameraImage cameraImage) async {
//     final result = await vision.yoloOnFrame(
//         bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
//         imageHeight: cameraImage.height,
//         imageWidth: cameraImage.width,
//         iouThreshold: 0.4,
//         confThreshold: 0.4,
//         classThreshold: 0.5);
//     if (result.isNotEmpty) {
//       setState(() {
//         yoloResults = result;
//       });
//     }
//   }

//   Future<void> startDetection() async {
//     setState(() {
//       isDetecting = true;
//     });
//     if (controller.value.isStreamingImages) {
//       return;
//     }
//     await controller.startImageStream((image) async {
//       if (isDetecting) {
//         cameraImage = image;
//         objectDetection(image);
//       }
//     });
//   }

//   Future<void> stopDetection() async {
//     setState(() {
//       isDetecting = false;
//       yoloResults.clear();
//     });
//   }

//   List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
//     if (yoloResults.isEmpty) return [];
//     double factorX = screen.width / (cameraImage?.height ?? 1);
//     double factorY = screen.height / (cameraImage?.width ?? 1);

//     Color colorPick = const Color.fromARGB(255, 50, 233, 30);

//     return yoloResults.map((result) {
//       return Positioned(
//         left: result["box"][0] * factorX,
//         top: result["box"][1] * factorY,
//         width: (result["box"][2] - result["box"][0]) * factorX,
//         height: (result["box"][3] - result["box"][1]) * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: Colors.pink, width: 2.0),
//           ),
//           child: Text(
//             "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = colorPick,
//               color: Colors.white,
//               fontSize: 18.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }
// }
