
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:robosoc/screens/navigatation_screen.dart';
import 'package:robosoc/screens/splash_screen1.dart';

import 'package:robosoc/screens/splash_screen2.dart';
import 'package:robosoc/screens/splash_screen3.dart';
import 'package:robosoc/screens/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAmvK_0bNoYtAZQNNA48tDXcVyYtSvWf6Q",
              appId: '1:1088636233768:web:6abf47f4ac10f300292d1d',
              messagingSenderId: "1088636233768",
              projectId: "robosoc-app"));
      
  runApp(const RobosocApp());
}

final kcolorScheme = ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: Colors.yellow,
    secondary: Colors.orange,
    surface: Colors.white,
    onSurface: const Color.fromRGBO(183, 144, 209, 1));

final theme = ThemeData()
    .copyWith(brightness: Brightness.light, colorScheme: kcolorScheme);

class RobosocApp extends StatelessWidget {
  const RobosocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigatationScreen(),
      theme: theme,
      // routes: {
      //   '/splash2': (context) => const SplashScreen2(),
      //   '/splash3': (context) => const SplashScreen3(),
      //   '/start': (context) => const StartScreen(),
      // },
    );
  }
}
