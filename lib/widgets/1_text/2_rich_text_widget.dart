import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: RichTextWidget()));
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rich Text Widget")),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: "Hello World",
            style: TextStyle(fontSize: 24, color: Colors.red),
            children: [
              TextSpan(
                text: ",Today is Sunday",
                style: TextStyle(fontSize: 24, color: Colors.cyan),
              ),
              TextSpan(
                text: ",Tmr is Monday",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
