import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'main.dart';

class arCamera extends StatefulWidget {
  //Default generate
  const arCamera({Key? key}) : super(key: key);

  @override
  State<arCamera> createState() => _arCameraState();
}

class _arCameraState extends State<arCamera> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  var output;
  var label;

  Timer? _debounceTimer;
  Duration _debounceTime = Duration(milliseconds: 5);

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  void runModelDebounced() {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(_debounceTime, () {
      runModel();
    });
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModelDebounced();
              });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
         bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          numResults: 2,
          threshold: 0.9,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
         output = element['label'];
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/mobilenet.tflite", labels: "assets/mobilenet.txt");
  }

  @override
  void dispose() {
    cameraController!.stopImageStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController!.value.isInitialized) {
      return Container();
    }
   return Scaffold(
      appBar: AppBar(title: Text("AR Camera")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: !cameraController!.value.isInitialized
                  ? Container()
                  : AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    ),
            ),
          ),

          Text(
            output ?? "", // Add null check and provide default value
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          ElevatedButton(
              onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "[Attraction Name]"
                      ),
                      content: Text(
                        "[Attraction Description]",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  );
              },
              child: Text('Show Attraction Details')
          ),
        ],
      ),
    );
  }
}
