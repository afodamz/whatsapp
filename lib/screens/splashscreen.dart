import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).popAndPushNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: Center(
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/whatsapplogo.jpeg")
              )
          ),
        ),
      ),
    );
  }
}
