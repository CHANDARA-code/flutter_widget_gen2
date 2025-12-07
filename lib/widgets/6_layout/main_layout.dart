import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learn_widgets/main.dart';
import 'package:learn_widgets/widgets/6_layout/1.container_widget/container_widget.dart';
import 'package:learn_widgets/widgets/6_layout/col_widget/col_widet.dart';
import 'package:learn_widgets/widgets/6_layout/grid_view/grid_view.dart';
import 'package:learn_widgets/widgets/6_layout/list_view/list_view_widget.dart';
import 'package:learn_widgets/widgets/6_layout/row_widget/row_widet.dart';
import 'package:learn_widgets/widgets/6_layout/stack_widget/stack_widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MayAppLayout()));
}

class MayAppLayout extends StatelessWidget {
  const MayAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout")),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContainerWidget()),
              );
            },
            child: Text("Usage Container"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RowWidet()),
              );
            },
            child: Text("Usage Row"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ColWidet()),
              );
            },
            child: Text("Usage Col"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => StackWidget()),
              );
            },
            child: Text("Usage Stack"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GridViewWidget()),
              );
            },
            child: Text("Usage GridView"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ListViewWidget()),
              );
            },
            child: Text("Usage List View"),
          ),
        ],
      ),
    );
  }
}
