import 'package:flutter/material.dart';

void main() => runApp(Settings());

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          scrollDirection: Axis.vertical,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Sound',
                                  style: Theme.of(context).textTheme.bodyText2),
                            ]),
                          ),
                        ),
                      ),
                      const Icon(Icons.radio_button_checked, size: 30,)
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
