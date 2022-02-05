import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/screens/home.dart';
import 'package:whatsapp/screens/splashscreen.dart';
import 'package:camera/camera.dart';
import 'dart:async';


void main() async {
  List<CameraDescription> cameras;
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(
      MaterialApp(
    title: 'WhatsApp clone',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SplashScreen(),
    routes: {
      "/home": (ctx) => Home(cameras: cameras),
    },
  ));
}
