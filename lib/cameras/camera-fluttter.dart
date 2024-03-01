import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';

class CameraFlutter extends StatelessWidget {
  const CameraFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.amber,
      onImageCaptured: (value) {
        final path = value.path;
        print("::::::::::::::::::::::::::::::::: $path");
        if (path.contains('.jpg')) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.file(File(path)),
                );
              });
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        print('::::::::::::::::::::::::;; dkdkkd $path');
        ///Show video preview .mp4
      },
    );
  }
}