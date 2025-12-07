import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.red,
                  child: Center(child: Text("Container 1")),
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                  child: Center(child: Text("Container 2")),
                ),
                Container(
                  width: 180,
                  height: 180,
                  color: Colors.grey,
                  child: Center(child: Text("Container 3")),
                ),

                Positioned(right: 12, top: 12, child: Icon(Icons.favorite)),
                Positioned(left: 12, bottom: 12, child: Icon(Icons.favorite)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
