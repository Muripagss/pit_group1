import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(GreenTechApp());

class GreenTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenTech',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
