import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/main.dart';
import 'package:shake/shake.dart';

import '../data/Player.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Play());
}

final myController = TextEditingController();
var players = <Player>[];
var playersDisplay = <String>[];
int digit1 = 3;
int digit2 = 1;

String getDice(int dice1, int dice2) {
  try {
    String str = "";
    if (dice1 > dice2 && dice1 != dice2) {
      str += dice1.toString() + dice2.toString();
    } else if (dice1 < dice2 && dice1 != dice2) {
      str += dice2.toString() + dice1.toString();
    } else if (dice1 == dice2) {
      str += dice1.toString() + dice2.toString();
    }
    return str;
  } catch (e) {
    return "";
  }
}

int getThrowValue(int input) {
  String firstDigit = input.toString().substring(0, 1);
  String secondDigit = input.toString().substring(1, 2);
  String fullDice = getDice(int.parse(firstDigit), int.parse(secondDigit));

  return int.parse(fullDice);
}

bool isAPosch(int throwToInspect) {
  return throwToInspect == 11 ||
      throwToInspect == 22 ||
      throwToInspect == 33 ||
      throwToInspect == 44 ||
      throwToInspect == 55 ||
      throwToInspect == 66;
}

String getName(String dice) {
  String name = "";
  switch (dice) {
    case "21":
      name = "Maier";
      break;
    case "11":
      name = "One posch";
      break;
    case "22":
      name = "Two posch";
      break;
    case "33":
      name = "Three posch";
      break;
    case "44":
      name = "Four posch";
      break;
    case "55":
      name = "Five posch";
      break;
    case "66":
      name = "Six posch";
      break;
    default:
      name = dice;
      break;
  }

  return name;
}

void deletePlayer(Player player) {
  players.remove(player);
  playersDisplay.remove(player.name.toString());
}

bool isMaier(int valueThrow) {
  return valueThrow == 21;
}

bool lowerThanThrow(int realThrow, int throwToCompare) {
  if (isMaier(realThrow) && !isMaier(throwToCompare)) {
    return false;
  } else if (!isMaier(realThrow) && isMaier(throwToCompare)) {
    return true;
  } else if (isAPosch(realThrow) && !isAPosch(throwToCompare)) {
    return false;
  } else if (!isAPosch(realThrow) && isAPosch(throwToCompare)) {
    return true;
  } else {
    return realThrow <= throwToCompare;
  }
}

int getNextValue(int ausgangsThrow) {
  int newThrow = ausgangsThrow;
  switch (ausgangsThrow) {
    case 11:
      newThrow = 22;
      break;
    case 22:
      newThrow = 33;
      break;
    case 32:
      newThrow = 41;
      break;
    case 33:
      newThrow = 44;
      break;
    case 43:
      newThrow = 51;
      break;
    case 44:
      newThrow = 55;
      break;
    case 54:
      newThrow = 61;
      break;
    case 55:
      newThrow = 66;
      break;
    case 65:
      newThrow = 11;
      break;
    case 66:
      newThrow = 21;
      break;
    default:
      ausgangsThrow + 1;
  }

  return newThrow;
}

int valueToOverthrow = 0;

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
            onPressed: () async => Navigator.of(context).pop(),
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
                    onPressed: () async {
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

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
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
            onPressed: () async => Navigator.of(context).pop(),
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
                        onPressed: () async {
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
                          onPressed: () async {
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
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                SingleChildScrollView(
                  child: ReorderableListView(
                    shrinkWrap: true,
                    onReorder: (int oldIndex, int newIndex) async {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final element = playersDisplay.removeAt(oldIndex);
                        playersDisplay.insert(newIndex, element);
                      });
                    },
                    children: playersDisplay
                        .map((player) => Dismissible(
                              key: ValueKey(player),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.startToEnd) {
                                  setState(() {
                                    playersDisplay.removeAt(
                                        playersDisplay.indexOf(player));
                                    players.removeAt(
                                        players.indexOf(Player(player)));
                                  });
                                  return true;
                                } else {
                                  setState(() {
                                    playersDisplay.removeAt(
                                        playersDisplay.indexOf(player));
                                    players.removeAt(
                                        players.indexOf(Player(player)));
                                  });
                                  return Future.value(
                                      direction == DismissDirection.endToStart);
                                }
                              },
                              child: Container(
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
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 1.0, color: Constants.darkGreen),
                    ),
                    icon: const Icon(
                      Icons.arrow_circle_right,
                      color: Constants.darkGreen,
                      size: 22.0,
                    ),
                    label: const Text(
                      'Play',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Constants.darkGreen),
                    ),
                    onPressed: () async => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const GamePlay();
                          },
                        ),
                      ),
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

int firstThrow = 0;
int realThrow = 0;

Widget startGame(
    BuildContext context, Player playerA, Player playerB, valueToOverthrow) {
  ShakeDetector.autoStart(onPhoneShake: () {
    digit1 = Random().nextInt(6) + 1;
    digit2 = Random().nextInt(6) + 1;
  });

  return MaterialApp(
    title: 'Poschen',
    theme: Constants.theme,
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () async => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Are you sure you want to quit?"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("Yes"),
                      onPressed: () async => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Play();
                            },
                          ),
                        ),
                      },
                    ),
                    TextButton(
                      child: const Text("No"),
                      onPressed: () async => {
                        Navigator.pop(context),
                      },
                    ),
                  ],
                );
              }),
        ),
        centerTitle: true,
        backgroundColor: Constants.darkGreen,
        elevation: 0,
      ),
      backgroundColor: Constants.darkGreen,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                    playerA.name.toString() +
                        " (" +
                        playerA.lives.toString() +
                        " ❤️)",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text('SHAKE!',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700))),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  'assets/Case_Closed.svg',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_circle_sharp,
                    color: Colors.white,
                    size: 0.0,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Constants.lightGreen,
                    alignment: AlignmentGeometry.lerp(
                        Alignment.centerLeft, Alignment.centerLeft, 0.0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  ),
                  label: const Text('Open Case',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  onPressed: () async => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        firstThrow = int.parse(getDice(digit1, digit2));
                        realThrow = firstThrow;
                        if (valueToOverthrow > 0 && !isMaier(firstThrow)) {
                          if (lowerThanThrow(firstThrow, valueToOverthrow) ||
                              firstThrow == valueToOverthrow) {
                            firstThrow = getNextValue(valueToOverthrow);
                          }
                          return MaterialApp(
                            title: 'Poschen',
                            theme: Constants.theme,
                            debugShowCheckedModeBanner: false,
                            home: Scaffold(
                              appBar: AppBar(
                                leading: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  onPressed: () async => {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Are you sure you want to quit?"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text("Yes"),
                                                onPressed: () => {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return const Play();
                                                      },
                                                    ),
                                                  ),
                                                },
                                              ),
                                              TextButton(
                                                child: const Text("No"),
                                                onPressed: () => {
                                                  Navigator.pop(context),
                                                },
                                              ),
                                            ],
                                          );
                                        }),
                                  },
                                ),
                                centerTitle: true,
                                backgroundColor: Constants.darkGreen,
                                elevation: 0,
                              ),
                              backgroundColor: Constants.darkGreen,
                              body: SafeArea(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 20.0),
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text('Number of dice rolled',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              getName(getDice(digit1, digit2)),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 50,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'assets/' +
                                                  getDice(digit1, digit2)[0] +
                                                  '_Left_Case.svg',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.325,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.325,
                                            ),
                                            SvgPicture.asset(
                                              'assets/' +
                                                  getDice(digit1, digit2)[1] +
                                                  '_Right_Case.svg',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.325,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.325,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            ElevatedButton.icon(
                                              icon: const Icon(
                                                Icons.add_circle_sharp,
                                                color: Colors.white,
                                                size: 0.0,
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Constants.lightGreen,
                                                alignment:
                                                    AlignmentGeometry.lerp(
                                                        Alignment.centerLeft,
                                                        Alignment.centerLeft,
                                                        0.0),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 0),
                                              ),
                                              label: const Text('Pass On',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white)),
                                              onPressed: () async => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return realGame(
                                                          context,
                                                          playerA,
                                                          firstThrow,
                                                          playerB,
                                                          valueToOverthrow,
                                                          realThrow);
                                                    },
                                                  ),
                                                ),
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          firstThrow = getNextValue(valueToOverthrow);
                        }
                        return MaterialApp(
                            title: 'Poschen',
                            theme: Constants.theme,
                            debugShowCheckedModeBanner: false,
                            home: Scaffold(
                              appBar: AppBar(
                                leading: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  onPressed: () async => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              "Are you sure you want to quit?"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Yes"),
                                              onPressed: () async => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return const Play();
                                                    },
                                                  ),
                                                ),
                                              },
                                            ),
                                            TextButton(
                                              child: const Text("No"),
                                              onPressed: () async => {
                                                Navigator.pop(context),
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                centerTitle: true,
                                backgroundColor: Constants.darkGreen,
                                elevation: 0,
                              ),
                              backgroundColor: Constants.darkGreen,
                              body: SafeArea(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 20.0),
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text('Number of dice rolled',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              getName(getDice(digit1, digit2)),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 50,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'assets/' +
                                                  getDice(digit1, digit2)[0] +
                                                  '_Left_Case.svg',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.325,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.325,
                                            ),
                                            SvgPicture.asset(
                                              'assets/' +
                                                  getDice(digit1, digit2)[1] +
                                                  '_Right_Case.svg',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.325,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.325,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            ElevatedButton.icon(
                                              icon: const Icon(
                                                Icons.add_circle_sharp,
                                                color: Colors.white,
                                                size: 0.0,
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Constants.lightGreen,
                                                alignment:
                                                    AlignmentGeometry.lerp(
                                                        Alignment.centerLeft,
                                                        Alignment.centerLeft,
                                                        0.0),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 0),
                                              ),
                                              label: const Text('Pass On',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white)),
                                              onPressed: () async => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return realGame(
                                                          context,
                                                          playerA,
                                                          firstThrow,
                                                          playerB,
                                                          valueToOverthrow,
                                                          realThrow);
                                                    },
                                                  ),
                                                ),
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      }),
                    ),
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

Widget realGame(BuildContext context, Player playerA, int dicePlayerA,
    Player playerB, int valueToOverthrow, int realThrow) {
  return MaterialApp(
    title: 'Poschen',
    theme: Constants.theme,
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () async => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Are you sure you want to quit?"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("Yes"),
                      onPressed: () async => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Play();
                            },
                          ),
                        ),
                      },
                    ),
                    TextButton(
                      child: const Text("No"),
                      onPressed: () async => {
                        Navigator.pop(context),
                      },
                    ),
                  ],
                );
              }),
        ),
        centerTitle: true,
        backgroundColor: Constants.darkGreen,
        elevation: 0,
      ),
      backgroundColor: Constants.darkGreen,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(playerB.name.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text('OH OH!',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700))),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  'assets/Case_Closed.svg',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Colors.white,
                            size: 0.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Constants.lightGreen,
                            alignment: AlignmentGeometry.lerp(
                                Alignment.centerLeft,
                                Alignment.centerLeft,
                                0.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                          ),
                          label: const Text('Believe',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          onPressed: () async => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                if (players.indexOf(playerB) + 1 ==
                                    players.length) {
                                  return startGame(context, playerB,
                                      players.elementAt(0), dicePlayerA);
                                } else {
                                  return startGame(
                                      context,
                                      playerB,
                                      players.elementAt(
                                          players.indexOf(playerB) + 1),
                                      dicePlayerA);
                                }
                              }),
                            ),
                          },
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Colors.white,
                            size: 0.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            alignment: AlignmentGeometry.lerp(
                                Alignment.centerLeft,
                                Alignment.centerLeft,
                                0.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                          ),
                          label: const Text('Not believe',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          onPressed: () async => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return notBelieveSituation(
                                    context,
                                    playerA,
                                    dicePlayerA,
                                    playerB,
                                    valueToOverthrow,
                                    realThrow);
                              }),
                            ),
                          },
                        ),
                      ])),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget notBelieveSituation(BuildContext context, Player playerA,
    int dicePlayerA, Player playerB, int valueToOverthrow, int realThrow) {
  if (lowerThanThrow(realThrow, valueToOverthrow)) {
    if (playerA.lives - 1 < 0) {
      deletePlayer(playerA);

      if (players.length == 1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('You are the winner!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back to home'),
                  onPressed: () async => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyApp();
                        },
                      ),
                    ),
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      playerA.lives -= 1;
      if (players.indexOf(playerA) + 1 == players.length) {
        return startGame(context, playerB, players.elementAt(0), 0);
      } else {
        return startGame(context, playerA,
            players.elementAt(players.indexOf(playerA) + 1), 0);
      }
    }
  } else if (!lowerThanThrow(realThrow, valueToOverthrow)) {
    if (playerB.lives - 1 < 0) {
      deletePlayer(playerB);

      if (players.length == 1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('${players[0].name}, you are the winner!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back to home'),
                  onPressed: () async => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyApp();
                        },
                      ),
                    ),
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      playerB.lives -= 1;
      if (players.indexOf(playerB) + 1 == players.length) {
        return startGame(context, playerB, players.elementAt(0), 0);
      } else {
        return startGame(context, playerB,
            players.elementAt(players.indexOf(playerB) + 1), 0);
      }
    }
  } else if (!isMaier(realThrow)) {
    //playera 2
    if (playerA.lives - 2 < 0) {
      deletePlayer(playerA);

      if (players.length == 1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('You are the winner!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back to home'),
                  onPressed: () async => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyApp();
                        },
                      ),
                    ),
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      playerA.lives -= 2;
      if (players.indexOf(playerA) + 1 == players.length) {
        return startGame(context, playerB, players.elementAt(0), 0);
      } else {
        return startGame(context, playerA,
            players.elementAt(players.indexOf(playerA) + 1), 0);
      }
    }
  } else {
    if (playerB.lives - 2 < 0) {
      deletePlayer(playerB);

      if (players.length == 1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('You are the winner!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back to home'),
                  onPressed: () async => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyApp();
                        },
                      ),
                    ),
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      playerB.lives -= 2;
      if (players.indexOf(playerB) + 1 == players.length) {
        return startGame(context, playerB, players.elementAt(0), 0);
      } else {
        return startGame(context, playerB,
            players.elementAt(players.indexOf(playerB) + 1), 0);
      }
    }
  }
  return AlertDialog(
    title: const Text('You are the winner!'),
    actions: <Widget>[
      TextButton(
        child: const Text('Back to home'),
        onPressed: () async => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyApp();
              },
            ),
          ),
        },
      ),
    ],
  );
}

class _GameState extends State<GamePlay> {
  @override
  Widget build(BuildContext context) {
    return startGame(context, players[0], players[1], 0);
  }
}
