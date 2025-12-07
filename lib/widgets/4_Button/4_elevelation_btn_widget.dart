import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: ElevelationBtnWidget()));
}

class ElevelationBtnWidget extends StatelessWidget {
  const ElevelationBtnWidget({super.key});
  /**
   * 
   * Elevelation button is component that we can teractable.
   */

  void onPressed() {
    print("onPressed Elevelation btn");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Elevelation")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: onPressed, child: Text("Press Me")),
            ElevatedButton(
              onPressed: () {
                print("Pressed Me inline");
              },
              child: Text("Press Me inline"),
            ),

            ElevatedButton(
              onLongPress: () {
                print("Long Press");
              },
              onPressed: () {
                print("Pressed Me inline");
              },
              child: Text("Long Press"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onLongPress: () {
                print("Long Press");
              },
              onPressed: () {
                print("Pressed Me inline");
              },
              child: Text("Design"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                elevation: 12,
                foregroundColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
            ),
          ],
        ),
      ),
    );

    return Text("-------data");
  }
}
