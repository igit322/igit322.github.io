import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// 스톱워치 기능구현
class _HomePageState extends State<HomePage> {
  List<String> lapTimes = []; //랩 타임을 기록할 변수
  Stopwatch watch = Stopwatch(); // 지속적으로 시간이 지나가는 변수
  String elapsedTime = "00:00:00:000"; // 경과 시간을 기록하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                elapsedTime,
                style: TextStyle(fontSize: 25),
              ),
              padding: EdgeInsets.all(20),
            ),
            Container(
              width: 100,
              height: 200,
              child: ListView(
                children: lapTimes.map((time) => Text(time)).toList(),
                // [
                //   Text('Lab3'),
                //   Text('01:00:00:0000'),
                //   Text('Lab2'),
                //   Text('01:00:00:0000'),
                //   Text('Lab1'),
                //   Text('01:00:00:0000'),
                // ],
              ),
            ),
            Container(
              // 플로팅 액션 버튼
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    child: !watch.isRunning
                        ? Icon(Icons.play_arrow)
                        : Icon(Icons.stop),
                    onPressed: () {
                      if (!watch.isRunning) {
                        startWatch();
                      } else {
                        stopWatch();
                      }
                    }, // 추가로 써줘야 인식됨
                  ),
                  FloatingActionButton(
                    child: !watch.isRunning ? Text('Reset') : Text('Lab'),
                    onPressed: () {
                      if (!watch.isRunning) {
                        resetWatch();
                      } else {
                        recordLapTime(elapsedTime);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  transTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    // truncate 소수점 제거
    // 15001 / 1000 = 15

    // 61 % 60 = 1 // toString 문자열 변경
    // padLeft 두자리수만 출력! 아닐때 '0'으로 표기

    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String minuteStr = (minutes % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minuteStr:$secondsStr:$milliseconds";
  }

  updatetime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transTime(watch.elapsedMilliseconds);
      });
    }
  }

  startWatch() {
    watch.start();
    Timer.periodic(Duration(milliseconds: 100), updatetime);
  }

  stopWatch() {
    setState(() {
      watch.stop();
    });
  }

  resetWatch() {
    setState(() {
      watch.reset();
      lapTimes.clear();
    });
  }

  setTime() {
    var timeFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transTime(timeFar);
    });
  }

  recordLapTime(String time) {
    lapTimes.insert(0, 'Lap ${lapTimes.length + 1} $time');
  }
}
