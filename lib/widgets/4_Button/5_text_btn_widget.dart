import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: TextBtnWidget()));
}

class TextBtnWidget extends StatelessWidget {
  const TextBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Btn")),

      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                print("OnPressed");
              },
              child: Text("Text Btn"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
                enableFeedback: true, // haptic feedback
                disabledBackgroundColor: Colors.amber,
                overlayColor: Colors.red,
                minimumSize: Size(45, 45),
              ),
              onPressed: () {
                print("OnPressed");
              },

              child: Text("Text Btn", style: TextStyle(color: Colors.black)),
            ),

            IconButton(
              onPressed: () {
                print("on Pressed Icon Btn");
              },
              icon: Icon(Icons.star),
            ),

            OutlinedButton.icon(
              onPressed: () {
                print("on Pressed Icon Btn");
              },
              label: Text("Outlined Button"),
            ),

            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                print("on Pressed Icon Btn");
              },
              label: Icon(Icons.star),
            ),
            FloatingActionButton(
              elevation: 23,
              onPressed: () {
                print("on Pressed FloatingActionButton");
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
