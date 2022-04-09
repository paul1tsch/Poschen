// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/screens/Play.dart';
import 'package:poschen/screens/about.dart';
import 'package:poschen/screens/settings.dart';

void main() {
  runApp(StartScreen());
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int index = 1;
  final screens = [
    Settings(),
    SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset('assets/dice_background.png', fit: BoxFit.fitHeight),
    ),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poschen',
      theme: Constants.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: screens[index],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 0, fontWeight: FontWeight.w600, fontFamily: 'Inter',)
              ),
            ),
            child: NavigationBar(
              height: 60,
              selectedIndex: index,
              onDestinationSelected: (index) =>
              setState(() => this.index = index),
              backgroundColor: Constants.darkGreen[600],
              destinations: const [
                NavigationDestination(label: 'Settings', icon: Icon(Icons.settings, size: 35.0, color: Colors.white)),
                NavigationDestination(label: 'Home', icon: Icon(Icons.home, size: 35.0, color: Colors.white)),
                NavigationDestination(label: 'About', icon: Icon(Icons.question_mark, size: 35.0, color: Colors.white)),
              ],
            ),
          ),

          // FloatingButton
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: 75.0,
            child: FloatingActionButton(
              onPressed: _startGame,
              tooltip: 'Start Game',
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              foregroundColor: Constants.darkGreen,
              child: Icon(Icons.add, size: 35.0),
            ),
          )
      ),
    );
  }

  void _startGame() {
  }
}

