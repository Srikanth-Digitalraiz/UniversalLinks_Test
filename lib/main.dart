import 'dart:io';

import 'package:face_emotion_detector/face_emotion_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlq/deep_li.dart';
import 'package:mlq/profile.dart';
import 'package:mlq/services/context_utility.dart';
import 'package:mlq/services/universal_lin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      title: 'Flutter UniLinking',
      initialRoute: '/',
      routes: {
        '/': (_) => InitialPage(),
        '/profile': (_) => Profile(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen")),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   File? _clinic_logo_image;
//   Future pickImage_clinic_logo() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) {
//         return;
//       }
//       final imageTemporary = File(image.path);
//       setState(() {
//         this._clinic_logo_image = imageTemporary;
//       });
//       labb();
//     } on PlatformException catch (e) {
//       print("Exception occured");
//     }
//   }

//   String emo = "Detecting...";

//   labb() async {
//     final emotionDetector = EmotionDetector();
//     final file = File(_clinic_logo_image!.path);
//     final label = await emotionDetector.detectEmotionFromImage(image: file);

//     print(label);
//     setState(() {
//       emo = label!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Column(
//               children: [
//                 _clinic_logo_image == null
//                     ? SizedBox()
//                     : Image.file(
//                         _clinic_logo_image!,
//                         height: 100,
//                         width: 200,
//                       ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   _clinic_logo_image == null ? "Select An Image" : '$emo',
//                 ),
//               ],
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           pickImage_clinic_logo();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add_a_photo),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
