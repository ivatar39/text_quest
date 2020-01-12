import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/* Ctrl + пробел - подсказки
* Alt + энтер - исправление
*/

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int stage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextQuest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Какой-нибудь любой текст'),
              Text('$stage'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Text('Назад'),
                    onPressed: () {
                      setState(() => stage--);
                      print('hello $stage');
                    },
                  ),
                  MaterialButton(
                    child: Text('Вперёд'),
                    onPressed: () {
                      setState(() => stage++);
                      print('hello $stage');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
