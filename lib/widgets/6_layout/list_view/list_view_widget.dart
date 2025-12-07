import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPaddingTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: 3,

        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.only(top: viewPaddingTop, bottom: 12),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "$index",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "$viewPaddingTop",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }
}
