import 'package:flutter/material.dart';

Color green = const Color(0x166534);
Color lightgreen = const Color(0x22C55E);

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Poschen'),
          backgroundColor: lightgreen,
        ),
        body: Center(
          child: Image(
            image: AssetImage('assets/background.png'),
          ),
        ),
      ),
    ),
  );
}
