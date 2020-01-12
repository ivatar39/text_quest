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
  int stage; // Текущая стадия
  Encounter encounter; // Текущее событие

  @override
  void initState() {
    // Срабатывает при появлении экрана
    stage = 0;
    encounter = encounters[stage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void nextStage(int nextStage) {
      setState(() {
        stage = nextStage;
        encounter = encounters[stage];
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),//TODO: Поменять тему приложения, сделать свою
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextQuest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(encounter.text),
              Flexible(flex: 4, child: Text('$stage')),
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
                        style: TextStyle(
                            //TODO: Поменять стиль текста, настроить на свой
                            ),
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
