import 'dart:math';
import 'package:colage_switch/switch_w_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String text1 = "Sleep";
  String text2 = "Breakfast";
  String text3 = "First Lecture";

  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  DateTime? lastSwitchChangeTime;
  Duration highScore = Duration(days: 1);

  void _updateHighScore() {
    if (lastSwitchChangeTime != null) {
      DateTime currentTime = DateTime.now();
      Duration timeDifference = currentTime.difference(lastSwitchChangeTime!);
      if (timeDifference < highScore) {
        setState(() {
          highScore = timeDifference;
        });
      }
      lastSwitchChangeTime = currentTime;
    } else {
      lastSwitchChangeTime = DateTime.now();
      highScore = Duration(days: 1);
    }
  }

  void _turnOffSwitch(int removeIndex) {
    if (value1 && value2 && value3) {
      List<int> cases = [0, 1, 2]..remove(removeIndex);
      int index = cases[Random().nextInt(cases.length)];

      switch (index) {
        case 0:
          value1 = false;
          _updateHighScore();
          break;
        case 1:
          value2 = false;
          _updateHighScore();
          break;
        case 2:
          value3 = false;
          _updateHighScore();
          break;
        default:
          value2 = false;
          _updateHighScore();
          break;
      }
    }
  }

  void onChanged1(bool newValue) {
    setState(() {
      value1 = newValue;
      _turnOffSwitch(0);
    });
  }

  void onChanged2(bool newValue) {
    setState(() {
      value2 = newValue;
      _turnOffSwitch(1);
    });
  }

  void onChanged3(bool newValue) {
    setState(() {
      value3 = newValue;
      _turnOffSwitch(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SwitchAndText(value: value1, text: text1, onChanged: onChanged1),
                      SwitchAndText(value: value2, text: text2, onChanged: onChanged2),
                      SwitchAndText(value: value3, text: text3, onChanged: onChanged3),
                    ],
                  ),
                ),
              ),
              if (highScore != Duration(days: 1))
                Text(
                  'High Score: ${highScore.inMilliseconds} milliseconds',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
