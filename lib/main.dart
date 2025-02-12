// ignore_for_file: unused_import, use_key_in_widget_constructors
//flutter build apk --split-per-abi
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robosoc/mainscreens/login_registerscreen/login_screen.dart';
import 'package:robosoc/mainscreens/navigatation_screen.dart';
import 'package:robosoc/mainscreens/startscreen/splash_screen1.dart';
import 'package:robosoc/mainscreens/startscreen/start_screen.dart';
import 'package:robosoc/utilities/component_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:robosoc/utilities/notification_provider.dart';
import 'package:robosoc/utilities/project_provider.dart';
import 'package:robosoc/utilities/user_profile_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "robosoc-app",
    options: const FirebaseOptions(
      apiKey: "AIzaSyAmvK_0bNoYtAZQNNA48tDXcVyYtSvWf6Q",
      authDomain: "robosoc-app.firebaseapp.com",
      projectId: "robosoc-app",
      storageBucket: "robosoc-app.appspot.com",
      messagingSenderId: "1088636233768",
      appId: "1:1088636233768:web:6abf47f4ac10f300292d1d",
      measurementId: "G-413P5KJ4C3",
    ),
  );

  runApp(const RobosocApp());
}

//defining color scheme
final kcolorScheme = ColorScheme.fromSwatch().copyWith(
  brightness: Brightness.light,
  primary: Colors.yellow,
  secondary: const Color.fromARGB(255, 254, 153, 0),
  surface: Colors.white,
  onSurface: const Color.fromRGBO(183, 144, 209, 1),
);

final theme = ThemeData().copyWith(
  brightness: Brightness.light,
  colorScheme: kcolorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class RobosocApp extends StatelessWidget {
  const RobosocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ComponentProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
        theme: theme,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user != null) {
            return NavigationScreen();
          } else {
            return const LoginScreen();
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
