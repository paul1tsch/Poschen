import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/main.dart';

import '../data/Player.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Play());
}

final myController = TextEditingController();
var players = <Player>[];
var playersDisplay = <String>[];

@override
void dispose() {
  myController.dispose();
}

class AddPlayer extends StatelessWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poschen',
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
                  'Add Player',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Name *',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      TextField(
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.text,
                        maxLength: 12,
                        controller: myController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Constants.darkGreen, width: 1.3),
                          ),
                          hintText: 'Gerry',
                          counterText: 'max. 12 characters',
                          helperText: '',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton.icon(
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
                      playersDisplay.add(myController.text);
                      players.add(Player(myController.text));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poschen',
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
                                return const AddPlayer();
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
                  padding: const EdgeInsets.only(top: 15),
                ),
                SingleChildScrollView(
                  child: ReorderableListView(
                    shrinkWrap: true,
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final element = playersDisplay.removeAt(oldIndex);
                        playersDisplay.insert(newIndex, element);
                      });
                    },
                    children: playersDisplay
                        .map(
                          (player) => Container(
                            key: ValueKey(player),
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              player,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
