import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poschen/constants.dart';
import 'package:poschen/main.dart';

void main() => runApp(Play());

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
            margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Play',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    scrollDirection: Axis.vertical,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Play\n',
                              style: Theme.of(context).textTheme.overline),
                          TextSpan(
                              text:
                                  'Have fun playing Poschen!',
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constants.darkGreen,
                      fixedSize: const Size(120, 50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    label: const Text('Play',
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
