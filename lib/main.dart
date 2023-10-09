import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/auth_page.dart';
// import 'package:onboarding_screen/screens/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// import 'package:onboarding_screen/screens/onboarding_screen.dart';
// import 'package:onboarding_screen/screens/signup_screen.dart';

// Step: Fix Cloud FireStore
// First add flutter.compileSdkVersion=21 in local.properties file.

// Then add this code in app\build.gradle

// def flutterMinSdkVersion = localProperties.getProperty('flutter.minSdkVersion')
// if (flutterMinSdkVersion == null) {
//     flutterMinSdkVersion = '21'
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ON BOARDING SCREEN.',
      theme: ThemeData.light(useMaterial3: true),
      // home: const OnBoardingScreen(),
      // home: SignInScreen(),
      home: const AuthPage(),
    );
  }
}
