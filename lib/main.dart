import 'package:flutter/material.dart';
import 'package:repeater/pages/repeater_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)
      ),
      debugShowCheckedModeBanner: false,
      home: RepeaterApp(),
    );
  }
}
