import 'package:flutter/material.dart';

class ColWidet extends StatelessWidget {
  const ColWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(color: Colors.blue, height: 50.0, width: 50.0),
          Icon(Icons.adjust, size: 50.0, color: Colors.pink),
          Icon(Icons.adjust, size: 50.0, color: Colors.purple),
          Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent),
          Container(color: Colors.orange, height: 50.0, width: 50.0),
          Icon(Icons.adjust, size: 50.0, color: Colors.cyan),
        ],
      ),
    );
  }
}
