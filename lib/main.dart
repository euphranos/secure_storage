import 'package:flutter/material.dart';
import 'package:secure_storage/screens/home_screen.dart';
import 'package:secure_storage/screens/navigate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NavigateScreen(),
    );
  }
}
