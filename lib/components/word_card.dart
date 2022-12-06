import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Color(0xFFFAF9F6),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Hello World'),
        ],
      ),
    );
  }
}
