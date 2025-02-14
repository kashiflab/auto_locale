import 'package:example/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AutoLocaleApp());
}

class AutoLocaleApp extends StatelessWidget {
  const AutoLocaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoLocale',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
