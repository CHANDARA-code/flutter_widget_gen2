

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: IconWidget());
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IconWedget")),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
            Icon(Icons.switch_account),
          ],
        ),
      ),
    );
  }
}
