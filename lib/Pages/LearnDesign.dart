import 'package:flutter/material.dart';

class LearnDesign extends StatelessWidget {
  const LearnDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Desing"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Center(child: Text("Hello")),
          )
        ],
      ),
    );
  }
}
