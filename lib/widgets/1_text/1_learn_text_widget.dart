import 'package:flutter/material.dart';

class LearnTextWidget extends StatelessWidget {
  const LearnTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Basic Widget"),
        actions: [Icon(Icons.settings_input_component_sharp)],
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Hello Flutter",
                style: TextStyle(
                  backgroundColor: Colors.amber,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Lorem Ipsum is simply dummy text of the printing.",
                maxLines: 2,
                textAlign: TextAlign.right,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Lorem Ipsum is simply dummy text of the printing.",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.center,
                textScaler: TextScaler.linear(1.2),
                strutStyle: StrutStyle(height: 4),
                style: TextStyle(
                  backgroundColor: Colors.red,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
