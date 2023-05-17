import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scrl(),
    ));

class Scrl extends StatefulWidget {
  const Scrl({Key? key}) : super(key: key);

  @override
  State<Scrl> createState() => _ScrlState();
}

class _ScrlState extends State<Scrl> {
  double startX = 0, startY = 0;
  double endX = 0, endY = 0;
  double dist = 0;
  double disp = 0;
  double curX = 0, curY = 0;
  double elapsedTime = 0;
  Timer? timer;
  Timer? distTime;
  double timepassed = 0;
  List<List<double>> distTrack = [];

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime = elapsedTime + 1;
      });
    });
  }

  void distTracker() {
    distTime = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        distTrack.insert(0, [curX.roundToDouble(), curY.roundToDouble()]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        setState(() {
          startX = event.position.dx;
          startY = event.position.dy;
          elapsedTime = 0;
          disp = 0;
          startTimer();
          distTracker();
        });
      },
      onPointerUp: (event) {
        setState(() {
          endX = event.position.dx;
          endY = event.position.dy;
          disp = sqrt(pow((startX - endX), 2) + pow((startY - endY), 2));
          print('start : (${startX.round()}, ${startY.round()})');
          print('end : (${endX.round()}, ${endY.round()})');
          print('disp : ${disp.round()}');
          print('elapsed : $elapsedTime');
          print('total time: $timepassed');
          print('---');
          timepassed = elapsedTime;
          timer?.cancel();
          distTime?.cancel();
          // distTrack = [];
        });
      },
      onPointerMove: (event) => setState(() {
        curX = event.position.dx;
        curY = event.position.dy;
      }),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 25, 25, 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Elapsed Time: $elapsedTime seconds',
                  style: const TextStyle(fontSize: 16)),
              Text('Time Passed: $timepassed seconds',
                  style: const TextStyle(fontSize: 16)),
              Text('List of co-ords: $distTrack',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

// functions to calculate the distances between x1, x2, y1 and y2 for each co-ord

void eucl(List<List<double>> points) {
  for (int i = 0; i < points.length; i++) {
    for (int j = i + 1; j < points.length; j++) {
      double dist = euclideanDistance(points[i], points[j]);
      print('distance btwn ($points[i]) and ($points[j]) is $dist');
    }
  }
}

double euclideanDistance(List<double> point1, List<double> point2) {
  double x1 = point1[0];
  double y1 = point1[1];
  double x2 = point2[0];
  double y2 = point2[1];

  return sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
}
