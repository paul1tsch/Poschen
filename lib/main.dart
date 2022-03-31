import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
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
        body: SizedBox(
          height: double.infinity,
          child: Image(
            image: AssetImage('assets/dice_background.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _startGame,
          tooltip: 'Start Game',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
