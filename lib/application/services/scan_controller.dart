import 'package:camera/camera.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  final RxBool _isInitialized = RxBool(false);
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  late CameraImage cameraImage;
  bool get isInitialized => _isInitialized.value;
  
  int _imageCount = 0; // to take count of the images in the stream
  RxString output = RxString("");
  // final RxList<Uint8List> _imageList = RxList();
  // List<Uint8List> get imageList => _imageList;

  CameraController get cameraController => _cameraController;

  // FlutterVision vision = FlutterVision();
  // Future<void> loadYoloModel() async {
  //   await vision.loadYoloModel(
  //       labels: 'assets/labels.txt',
  //       modelPath: 'assets/model_float32.tflite',
  //       modelVersion: "yolov8",
  //       numThreads: 2,
  //       useGpu: true);
  // }

  // Future<void> startDetection() async {
  //   setState(() {
  //     isDetecting = true;
  //   });
  //   if (controller.value.isStreamingImages) {
  //     return;
  //   }
  //   await controller.startImageStream((image) async {
  //     if (isDetecting) {
  //       cameraImage = image;
  //       yoloOnFrame(image);
  //     }
  //   });
  // }

  // Future<void> stopDetection() async {
  //   setState(() {
  //     isDetecting = false;
  //     yoloResults.clear();
  //   });
  // }
  

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.bgra8888); //addition
    _cameraController.initialize().then((_) {
      _isInitialized.value = true;
      _cameraController.startImageStream((image) {
        // cameraImage = image;
        // print(DateTime.now().millisecondsSinceEpoch);
        _imageCount++;
        if (_imageCount % 20 == 0) {
          _imageCount = 0;
          // objectRecognition(image);
        }
        update();
      });
      // _isInitialized.refresh(); // addition
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

  // Future<void> objectRecognition(CameraImage cameraImage) async {
  //   try {
  //     var recognitions = await vision.yoloOnFrame(
  //         bytesList: cameraImage.planes.map((plane) {
  //           return plane.bytes;
  //         }).toList(), // required
          
  //         imageHeight: cameraImage.height,
  //         imageWidth: cameraImage.width);

  //     if (recognitions != null) {
  //       print("Output Shape: ${recognitions[0]["shape"]}");
  //       for (var element in recognitions) {
  //         output = RxString(element["tag"]);
  //       }
  //       // log("$recognitions");
  //     }
  //   } catch (e, stackTrace) {
  //     print("Exception occurred: $e");
  //     print("Stack trace: $stackTrace");
  //     // Handle the exception gracefully
  //     Get.snackbar("Error", "Running model has failed");
  //   }
  // }

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // _initCamera();
    // _initTensorFlow();
    super.onInit();
  }

  void capture() {
    // img.Image image =
    //     img.Image(width: cameraImage.width, height: cameraImage.height);
    // Uint8List jpeg = Uint8List.fromList(img.encodeJpg(image));
    // print(jpeg.length);
    // print("Image captured");

    // if (cameraImage != null) {
    //   img.Image image = img.Image.fromBytes(
    //     width: cameraImage.width,
    //     height: cameraImage.height,
    //     bytes: cameraImage.planes[0].bytes.buffer,
    //     // format: img.Format.bgra
    //   );
    //   Uint8List list = Uint8List.fromList(img.encodeJpg(image));
    //   _imageList.add(list);
    //   _imageList.refresh();
    // }
  }
}
