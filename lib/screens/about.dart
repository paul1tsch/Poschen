import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/main.dart';

void main() => runApp(About());

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

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
          toolbarHeight: 50.0,
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
                  'What is Poschen?',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    scrollDirection: Axis.vertical,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Setup ⚙️\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                'A smartphone is needed. All players should be at a '
                                'table or in a circle so that passing the smartphone is as easy'
                                ' as possible.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'Goal 🥅\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                'The objective of the game is to roll a 21 (Mayer) '
                                'or to reveal a lie of the accuser.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'Values 🔢\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                'In classic Poschen, the higher value of a die'
                                ' is interpreted as a tens digit and the lower value '
                                'as a ones digit.\nThe order of possible number combinations'
                                ' in ascending value: 31, 32, 41, 42, '
                                '43, 52, 53, 54, 61, 62, 63, 64, 65. 65 is the highest number'
                                ' combination that is not a Posch and not a Mayer. It can '
                                'only be beaten by them.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'Special numbers 🎲\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                '11, 22, 33, 44, 55, 66. These are called one posch, two posch, three posch, four'
                                ' posch, five posch and six posch. A six posch is the second highest '
                                'number combination.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'Mayer 🎲\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                'Mayer is the number combination 21. It is the highest number '
                                'combination and cannot be beaten.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'This is how it works 💻\n',
                            style: Theme.of(context).textTheme.overline),
                        TextSpan(
                            text:
                                'The first player starts and shakes the phone. '
                                'He may then look under the glasses pocket. The first player '
                                'enters a number and then says the number and passes the '
                                'smartphone to the second player. The first player may '
                                'announce a number (or a posch/mayer) and may lie while doing '
                                'so.The objective of the game is to roll a 21 (Mayer) '
                                'or to reveal a lie of the accuser.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: 'The second player now has two options 🙋:\n',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text: 'First - he believes the player: ✅\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text:
                                'If he believes the first player, he is not allowed to check if the mentioned '
                                'number of the first player was a lie. He must now shake the smartphone and announce a number that must'
                                ' be higher than the first player\'s (his foreplayer\'s) named number. Even if his'
                                ' rolled number is lower. He hands the smartphone to the next player after announcing. The'
                                ' next player again has these two options.\n\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text:
                                'Second - he does not believe the player: ❌\n',
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text:
                                'If he thinks the player lied when announcing his number, he may open the glasses pocket '
                                'and must show the dice to the round. If the announced value of the'
                                ' first player (his predecessor) is not correct, but is lower than '
                                'his rolled result, the predecessor loses one life. If the previous '
                                'player\'s value is correct, or if the previous player\'s rolled value'
                                ' is greater than the announced value, the player who accused the '
                                'previous player of lying must subtract one life.\nAfter uncovering, '
                                'the game starts again from the beginning. The player who was the '
                                'last to accuse another player of lying may start.\nIf a player '
                                'declares a Mayer (21), the next player may of course'
                                ' uncover and accuse him of lying, or he may try to roll a '
                                'Mayer himself. If the player fakes a Mayer and it is revealed,'
                                ' the previous player gets two lives subtracted. If it is '
                                'revealed and there is actually a Mayer'
                                ' in the glasses pocket, the player gets two lives deducted.\n',
                            style: Theme.of(context).textTheme.bodyText2),
                      ]),
                    ),
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
