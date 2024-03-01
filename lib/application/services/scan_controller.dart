import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:tflite/tflite.dart';

class ScanController extends GetxController {
  RxBool _isInitialized = RxBool(false);
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  late CameraImage cameraImage;
  bool get isInitialized => _isInitialized.value;
  final RxList<Uint8List> _imageList = RxList();
  int _imageCount = 0; // to take count of the images in the stream
  RxString output = RxString("");

  List<Uint8List> get imageList => _imageList;
  CameraController get cameraController => _cameraController;

  Future<void> _initTensorFlow() async {
    String? res = await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
        isAsset: true);
  }

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
        if (_imageCount % 10 == 0) {
          _imageCount = 0;
          objectRecognition(image);
        }
      });
      _isInitialized.refresh(); // addition
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
    recognitions!.forEach((element) {
      output = RxString(element['label']);
    });
    print(output);
  }

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  void onInit() {
    _initCamera();
    _initTensorFlow();
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
