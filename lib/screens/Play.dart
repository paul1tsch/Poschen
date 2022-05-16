import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Play());
}

class Play extends StatelessWidget {
  const Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: Constants.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Players',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.notification_important,
                      color: Colors.redAccent,
                      size: 14.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('Maximum 10 Players',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Constants.darkGreen,
                          alignment: AlignmentGeometry.lerp(
                              Alignment.centerLeft, Alignment.centerLeft, 0.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                        ),
                        label: const Text('Add Player',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const MyApp();
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Constants.darkGreen),
                          ),
                          icon: const Icon(
                            Icons.history,
                            color: Constants.darkGreen,
                            size: 16.0,
                          ),
                          label: const Text(
                            'History',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Constants.darkGreen),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MyApp();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 0.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constants.darkGreen,
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
                            return const MyApp();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
