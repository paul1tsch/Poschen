// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/screens/Play.dart';
import 'package:poschen/screens/about.dart';
import 'package:poschen/screens/settings.dart';

void main() {
  runApp(StartScreen());
}

void _startGame() {}
//
//
// List pages = [
//   Settings(),
//   Play(),
//   About()
// ];
//
// int currentIndex = 0;
// void onTap(int index){
//   setState((){
//     currentIndex = index;
//   });
// }


class StartScreen extends StatelessWidget{
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Poschen',
      theme: Constants.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/dice_background.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 75.0,
            child: BottomNavigationBar(
              // currentIndex: currentIndex,
              // onTap: onTap,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Constants.darkGreen[600],
              selectedItemColor: Color(0xFFFFFFFF),
              unselectedItemColor: Color(0xFFFFFFFF),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings, size: 35.0)),
                BottomNavigationBarItem(label: 'About', icon: Icon(Icons.question_mark, size: 35.0)),
              ],
            ),
          ),

          // FloatingButton
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 20),
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
}


