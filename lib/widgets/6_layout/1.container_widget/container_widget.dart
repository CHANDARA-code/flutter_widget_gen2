import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width: 50, height: 50, color: Colors.amber),
            SizedBox(height: 12),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  width: 12,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
              ),
            ),

            SizedBox(height: 12),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(12, 23),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(252, 70, 107, 1.0), // #FC466B
                    Color.fromRGBO(63, 94, 251, 1.0), // #3F5EFB
                    Color.fromRGBO(126, 63, 251, 1.0), // #7E3FFB
                    Color.fromRGBO(220, 63, 251, 1.0), // #DC3FFB
                    Color.fromRGBO(251, 63, 188, 1.0), // #FB3FBC
                  ],
                  stops: [0.25, 0.75, 0.87, 0.93, 0.96],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            SizedBox(height: 12),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.only(left: 12, top: 18),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.rectangle,
              ),

              child: Text("Data"),
            ),

            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.only(left: 12, top: 18),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFdbd0d0).withOpacity(1),
                    offset: Offset(-3, 6),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ],
                shape: BoxShape.rectangle,
              ),

              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(color: Colors.amber, child: Text("Data")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
