import 'package:assignment2_277209/pages/splashScreen.dart';
import 'package:flutter/material.dart';
//C:\Users\user\OneDrive\Documents\UUM\Sem 5\MOBILE PROGRAMMING\Assignment\peinyuk\lib\main.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homestay Raya',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const SplashScreen(),
    );
  }
}
