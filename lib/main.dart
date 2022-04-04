// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color green = const Color(0x166534);
Color lightgreen = const Color(0x22C55E);

void main() {
  runApp(MyApp());
}

void _startGame() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Background
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image(
            image: AssetImage('assets/dice_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: green,
          fixedColor: green,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 50,
                height: 50,
              ),
              label: '',
              tooltip: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: '',
              tooltip: 'About the Game',
            )
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        // FloatingButton
        floatingActionButton: FloatingActionButton(
          onPressed: _startGame,
          tooltip: 'Start Game',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
