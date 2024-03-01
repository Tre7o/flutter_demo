import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import '../screens/camera_screen.dart';
import '../../application/services/camera_service.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Translator',
        leadingWidget: BackButton(
          color: Colors.black,
        ),
      ),
      body: const CameraService()
      // body: CameraScreen()
    );
    // return Container();
  }
}