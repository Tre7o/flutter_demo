// import 'dart:convert';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_demo/presentation/widgets/loading.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../../presentation/widgets/capture_button.dart';

// class CameraService extends StatefulWidget {
//   const CameraService({super.key});

//   @override
//   State<CameraService> createState() => _CameraServiceState();
// }

// class _CameraServiceState extends State<CameraService> {
//   final RxBool _isInitialized = RxBool(false);

//   CameraController? _cameraController;

//   late List<CameraDescription> _cameras;
//   late CameraImage cameraImage;
//   bool _isRecording = false;
//   String _prediction = '';

//   Future<void> _initCamera() async {
//     _cameras = await availableCameras();
//     _cameraController = CameraController(_cameras[0], ResolutionPreset.max,
//         imageFormatGroup: ImageFormatGroup.bgra8888); //addition
//     _cameraController!.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {
//         _isInitialized.value = true;
//         _cameraController!.startImageStream((image) {
//           // cameraImage = image;
//           // print(DateTime.now().millisecondsSinceEpoch);

//           // Convert camera image to bytes
//           Uint8List bytes = image.planes[0].bytes;

//           // Send image data to Flask server for processing
//           _sendImageToServer(bytes);
//         });
//       });
//     }).catchError((Object e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case 'CameraAccessDenied':
//             print('User denied access to camera');
//             break;
//           default:
//             print('Handle other errors');
//             break;
//         }
//       }
//     });
//   }

//   // Future<void> _toggleRecording() async {
//   //   if (_isRecording) {
//   //     // Stop recording
//   //     _isRecording = false;
//   //     await _cameraController!.stopImageStream();
//   //   } else {
//   //     // Start recording
//   //     _isRecording = true;
//   //     _cameraController!.startImageStream((CameraImage cameraImage) {
//   //       // Convert camera image to bytes
//   //       Uint8List bytes = cameraImage.planes[0].bytes;

//   //       // Send image data to Flask server for processing
//   //       _sendImageToServer(bytes);
//   //     });
//   //   }

//   //   if (mounted) {
//   //     setState(() {});
//   //   }
//   // }

//   Future<void> _sendImageToServer(Uint8List imageData) async {
//     String url = 'http://localhost:5000/predict';
//     try {
//       // Send image data to Flask server
//       http.Response response = await http.post(
//         Uri.parse(url),
//         body: jsonEncode({'image': base64Encode(imageData)}),
//         headers: {'Content-Type': 'application/json'},
//       );

//       // Handle response from server
//       if (response.statusCode == 200) {
//         // Update UI with prediction
//         setState(() {
//           _prediction = jsonDecode(response.body)['prediction'];
//         });
//       } else {
//         print('Error: ${response.statusCode}');
//         print('Message: ${response.body}');
//       }
//     } catch (e) {
//       print('Try Error: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _isInitialized.value = false;
//     _cameraController!.dispose();
//     // Tflite.close();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isInitialized.value) {
//       print("from build ${_isInitialized.value}");
//       return const Loading();
//     }
//     return Column(
//       children: [
//         SizedBox(
//             height: Get.height - 300,
//             width: Get.width,
//             child: CameraPreview(
//               _cameraController!,
//               child: CaptureButton(),
//             )),
//         SizedBox(
//           child: Container(
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 2, color: Colors.black)),
//               child: Text(_prediction)),
//         )
//       ],
//     );
//   }
// }
