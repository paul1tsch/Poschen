import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/screens/about.dart';
import 'package:poschen/screens/settings.dart';

void main() {
  runApp(const StartScreen());
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int index = 1;
  final screens = [
    const Settings(),
    SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset('assets/dice_background.png', fit: BoxFit.fitHeight),
    ),
    const About(),
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
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontSize: 0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            )),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            backgroundColor: Constants.darkGreen[600],
            destinations: const [
              NavigationDestination(
                  label: 'Settings',
                  icon: Icon(Icons.settings, size: 35.0, color: Colors.white)),
              NavigationDestination(
                  label: 'Home',
                  icon: Icon(Icons.home, size: 35.0, color: Colors.white)),
              NavigationDestination(
                  label: 'About',
                  icon: Icon(Icons.question_mark,
                      size: 35.0, color: Colors.white)),
            ],
          ),
        ),

        // FloatingButton
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SecondRoute()));
          },
          tooltip: 'Start Game',
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          foregroundColor: Constants.darkGreen,
          child: const Icon(Icons.add, size: 35.0),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign out'),
          onPressed: () async {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const StartScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
