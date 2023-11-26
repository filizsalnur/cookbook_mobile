import 'package:cookbook_mobile/pages/welcome.dart';
import 'package:cookbook_mobile/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      title: 'Flutter Demo',
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
