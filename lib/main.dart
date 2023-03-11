import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/facebook/Home.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'instagram-clone', options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      // ThemeData.dark().copyWith(
      //   // textTheme: const TextTheme(
      //   //     textLarge:TextStyle(fontSize: 20)
      //   // )
      //   textTheme: const TextTheme(
      //     displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      // ),
      home: Home()
    );
  }
}
