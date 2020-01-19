import 'package:flutter/material.dart';
import 'package:text_quest/constants.dart';
import 'package:text_quest/encounter.dart';

void main() => runApp(MyApp());

/* Ctrl + пробел - подсказки
* Alt + энтер - исправление
*/

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int id; // Текущая стадия
  Encounter encounter; // Текущее событие

  @override
  void initState() {
    // Срабатывает при появлении экрана
    id = 0;
    encounter = encounters[id];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void nextStage(int nextId) {
      setState(() {
        id = nextId;
        encounter = encounters[id];
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), //TODO: Поменять тему приложения, сделать свою
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextQuest'),
          // TODO: Поменять название приложения
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  flex: 4,
                  child: Text(
                    encounter.text,
                    style: TextStyle(fontSize: 18),
                  )),
              Flexible(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: encounter.options.length,
                  shrinkWrap: true,
                  itemBuilder: ((BuildContext context, int index) {
                    return MaterialButton(
                      child: Text(
                        encounter.options[index].text,
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        nextStage(encounter.options[index].id);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
