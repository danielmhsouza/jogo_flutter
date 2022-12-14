import 'package:flutter/material.dart';

import 'mainGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PacMan - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const GameController(),
    );
  }
}
