import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whatsapp/utils/utilities.dart';

class CameraPage extends StatefulWidget {
  CameraPage({required this.controller});

  final PageController controller;
  final double iconHeight = 30;
  final double imageHeight = 100;
  final double imageWidth = 100;
  final PageController bottomPageController =
  PageController(viewportFraction: .2);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _controllerInizializer;
  double cameraHorizontalPosition = 0;

  Future<CameraDescription> getCamera() async {
    final c = await availableCameras();
    return c.first;
  }

  @override
  void initState() {
    super.initState();

    getCamera().then((camera) {
      if (camera == null) return;
      setState(() {
        _controller = CameraController(
          camera,
          ResolutionPreset.high,
        );
        _controllerInizializer = _controller.initialize();
        _controllerInizializer.whenComplete(() {
          setState(() {
            cameraHorizontalPosition = -(MediaQuery.of(context).size.width*_controller.value.aspectRatio)/2;
          });
        });
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // if (!_controller.value.isInitialized) {
    //   return Container();
    // }
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          /* trying to preserve aspect ratio */
          left: cameraHorizontalPosition,
          right: cameraHorizontalPosition,
          child: FutureBuilder(
            future: _controllerInizializer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 20,
                    right: 40,
                    left: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.keyboard_arrow_up, color: Colors.white,),
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: widget.imageHeight,
                                width: widget.imageWidth,
                                child: ClipRRect(
                                  child: Image.network(
                                    Utils.image(),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: widget.imageHeight,
                                width: widget.imageWidth,
                                child: ClipRRect(
                                  child: Image.network(
                                    Utils.image(),
                                  ),
                                ),
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: widget.iconHeight,
                              child: Icon(
                                Icons.flash_on,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: widget.iconHeight,
                              child: Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
