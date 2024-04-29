import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fyp003/attraction_list/list.dart';
import 'package:fyp003/change_color_mode/theme_provider.dart';
import 'package:fyp003/translation_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';

import 'change_color_mode/change_theme_button_widget.dart';
import 'arCamera.dart';
import 'dummyAttraction.dart';
import 'miniGame.dart';
import 'notifi_service.dart';
import 'AttractionGrid.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  NotificationService().initNotification();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: Home(),
          );
        },
      );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showLogo = true;
  int _currentIndex = 0;
  late PageController _pageController;
  Position? _currentUserPosition;
  double? distanceInMeter = 0.0;
  Data data = Data();
  bool loading = true;
  File? file;
  var output;
  var secondIndex;
  var label;
  var description;
  ImagePicker image = ImagePicker();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _getTheDistance();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(_currentUserPosition!.latitude);
    print(_currentUserPosition!.longitude);
    for (int i = 0; i < data.allattraction.length; i++) {
      double attraction_latitude = data.allattraction[i]['lat'];
      double attraction_longtitude = data.allattraction[i]['lng'];

      distanceInMeter = await Geolocator.distanceBetween(
        _currentUserPosition!.latitude,
        _currentUserPosition!.longitude,
        attraction_latitude,
        attraction_longtitude,
      );

      var distance = distanceInMeter?.toInt();
      data.allattraction[i]['distance'] = (distance! / 1000);
      setState(() {});
    }
  }

  detectimage(File l) async {
    var prediction = await Tflite.runModelOnImage(
      path: l.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      output = prediction;
      label = (output![0]['label']).toString();
      secondIndex = int.parse(output![0]['index'].toString());
      description = data.allattraction[secondIndex]['description'];
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/AttractionRecognition.tflite",
      labels: "assets/AttractionLabel.txt",
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  getImageFromCamera() async {
    var img = await image.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  getImageFromGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: ListBar(), // Side Menu Button
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'UTAR GrandHall Camera',
        ),
        actions: [
          // Change color mode button
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Container(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: h,
                  width: w,
                  child: Column(
                    children: [
                      if (loading == true)
                        Container()
                      else
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Theme.of(context).iconTheme.color,
                            child: Column(
                              children: [
                                Container(
                                  height: 350,
                                  padding: const EdgeInsets.all(20),
                                  child: Image.file(file!),
                                ),
                                if ((output![0]['confidence']) >= 0.90)
                                  Column(
                                    children: [
                                      Text(
                                        (output![0]['label'])
                                            .toString(),
                                      ),
                                       Text(
                                        'Confidence: ' +
                                            (output![0]['confidence'])
                                                .toStringAsFixed(4),
                                      ),
                                    ],
                                  )
                                else
                                  Text("No Target Attraction"),
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                            (output![0]['label'])
                                                .toString(),
                                          ),
                                          content: Text(
                                            description ?? 'No data available',
                                            textAlign: TextAlign.justify,
                                            // style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      );
                                      if (data != null) {
                                        if (secondIndex > 0) {
                                          NotificationService().showNotification(
                                              title: (output![0]['label'])
                                                  .toString(),
                                              body:
                                                  'You are ${data.allattraction[secondIndex - 1]['distance']} KM away');
                                        } else {
                                          NotificationService()
                                              .showNotification(
                                            title: (output![0]['label'])
                                                .toString(),
                                            body: 'Please input a valid image!',
                                          );
                                        }
                                      } else {
                                        // Handle the case where `data` is null
                                        print('Data is null');
                                      }
                                    },
                                    child: Text('Show Attraction Details')),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              height: 60,
                              color: Colors.blueGrey[600],
                              child: const Text("Select Image from Gallery",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold)),
                              onPressed: getImageFromGallery,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            MaterialButton(
                              height: 60,
                              color: Colors.blueGrey[600],
                              child: const Text("Select Image from Camera",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold)),
                              onPressed: getImageFromCamera,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            // MaterialButton(
                            //   height: 60,
                            //   color: Colors.blueGrey[600],
                            //   child: const Text(
                            //       "              AR Camera              ",
                            //       style: TextStyle(
                            //           fontSize: 25,
                            //           color: Colors.white70,
                            //           fontWeight: FontWeight.bold)),
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => arCamera()),
                            //     );
                            //   },
                            // ),
                            if (loading == true)
                              Expanded(
                                child: Image(
                                  image: AssetImage("assets/logo.png"),
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                child: AttractionGrid(
                  data:data,
                  h: h,
                  w: w,
                ),
            ),
            Container(
              child: MiniGame(),
            ),
            Container(
              child: TranslationPage(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavyBarItem(
            title: Text('Attraction List'),
            icon: Icon(Icons.map),
          ),
          BottomNavyBarItem(
            title: Text('Mini Game'),
            icon: Icon(Icons.videogame_asset_sharp),
          ),
          BottomNavyBarItem(
            title: Text('Translator'),
            icon: Icon(Icons.chat),
          ),
        ],
      ),
    );
  }
}
