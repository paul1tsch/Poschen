import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poschen/screens/Play.dart';
import 'package:poschen/screens/about.dart';

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poschen',
      theme: Constants.theme,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,

                    colors: <Color>[
                      Constants.lightGreen,
                      Constants.darkGreen
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(20, 180, 20, 200),
                child: Card(
                  elevation: 20,
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(),
                  child: SizedBox(
                    height: 200,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text('Welcome to',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            textAlign: TextAlign.center),
                        Text(
                          'Poschen',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 450, 20, 200),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Constants.darkGreen,
                          fixedSize: const Size(200, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        label: const Text('Start Game',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Play();
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.question_mark,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Constants.darkGreen,
                            fixedSize: const Size(200, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          label: const Text(
                            'About',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const About();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/screens/about.dart';
import 'package:poschen/screens/settings.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
      title: 'Poschen',
      theme: Constants.theme,
      debugShowCheckedModeBanner: false,
      home: const StartScreen()));
}

void startGame() {
  print("hallo");
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,

                  colors: <Color>[
                    Constants.lightGreen,
                    Constants.darkGreen
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              margin: const EdgeInsets.fromLTRB(20, 180, 20, 200),
              child: Card(
                elevation: 20,
                color: Colors.transparent,
                shape: const RoundedRectangleBorder(),
                child: SizedBox(
                  height: 200,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Welcome to',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          textAlign: TextAlign.center),
                      Text(
                        'Poschen',
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 450, 20, 200),
              child: Center(
                child: Column(
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Constants.darkGreen,
                        fixedSize: const Size(200, 50),
                        alignment: AlignmentGeometry.lerp(
                            AlignmentDirectional.topCenter,
                            AlignmentDirectional.bottomEnd,
                            0.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      label: const Text('Start Game',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.question_mark,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Constants.darkGreen,
                          alignment: AlignmentGeometry.lerp(
                              AlignmentDirectional.topCenter,
                              AlignmentDirectional.bottomEnd,
                              0.0),
                          fixedSize: const Size(200, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        label: const Text(
                          'About',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return About();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // body: screens[index],
    // bottomNavigationBar: NavigationBarTheme(
    //   data: NavigationBarThemeData(
    //     indicatorColor: Colors.transparent,
    //     labelTextStyle: MaterialStateProperty.all(const TextStyle(
    //       fontSize: 0,
    //       fontWeight: FontWeight.w600,
    //       fontFamily: 'Inter',
    //     )),
    //   ),
    //   child: NavigationBar(
    //     height: 60,
    //     selectedIndex: index,
    //     onDestinationSelected: (index) =>
    //         setState(() => this.index = index),
    //     backgroundColor: Constants.darkGreen[600],
    //     destinations: const [
    //       NavigationDestination(
    //           label: 'Settings',
    //           icon: Icon(Icons.settings, size: 35.0, color: Colors.white)),
    //       NavigationDestination(
    //           label: 'Home',
    //           icon: Icon(Icons.home, size: 35.0, color: Colors.white)),
    //       NavigationDestination(
    //           label: 'About',
    //           icon: Icon(Icons. ,
    //               size: 35.0, color: Colors.white)),
    //     ],
    //   ),
    // ),

    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // floatingActionButton: SizedBox(
    //   width: 75,
    //   child: FloatingActionButton(
    //     onPressed: () {
    //       // (index) => setState(() => this.index = index);
    //     },
    //     tooltip: 'Start Game',
    //     backgroundColor: Colors.white,
    //     shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
    //     foregroundColor: Constants.darkGreen,
    //     child: const Icon(Icons.add, size: 35.0),
    //   ),
    // ),
  }
}

 */
