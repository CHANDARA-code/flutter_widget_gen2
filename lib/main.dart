import 'package:flutter/material.dart';
import 'package:learn_widgets/widgets/1_text/1_learn_text_widget.dart';
import 'package:learn_widgets/widgets/2_image/2_image_widget.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: ImageWidget(),
    );
  }
}
