import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
  double timePassed = 0;
  List<List<double>> distTrack = [];
  double totalDistance =
      0; // adds all the distances to calculate the total distance covered

  @override
  void dispose() {
    distTime?.cancel();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        elapsedTime += 0.1;
      });
    });
  }

  void distTracker() {
    distTime = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        distTrack.insert(0, [curX.round().toDouble(), curY.round().toDouble()]);
        totalDistance += sqrt(pow((distTrack[0][0] - distTrack[1][0]), 2) +
            pow((distTrack[0][1] - distTrack[1][1]), 2));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // FlutterBackgroundService().invoke('setAsForeground');
    // FlutterBackgroundService().invoke('setAsBackground');
    // final service = FlutterBackgroundService();
    // bool isRunning = await service.isRunning();
    // if (isRunning){

    // }
    // else{

    // }
    return Listener(
      onPointerDown: (event) {
        setState(() {
          // FlutterBackgroundService().invoke('setAsForeground');
          // final service = FlutterBackgroundService();
          // service.startService();
          startX = event.position.dx;
          startY = event.position.dy;
          curX = startX;
          curY = startY;
          elapsedTime = 0;
          disp = 0;
          distTrack = [];
          distTrack.insert(
              0, [startX.round().toDouble(), startY.round().toDouble()]);
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
          print('total time: $timePassed');
          print('---');
          timePassed = elapsedTime;
          distTrack
              .insert(0, [endX.round().toDouble(), endY.round().toDouble()]);
          totalDistance += sqrt(pow((distTrack[0][0] - distTrack[1][0]), 2) +
              pow((distTrack[0][1] - distTrack[1][1]), 2));
          timer?.cancel();
          distTime?.cancel();
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
              Text(
                'Start position : (${startX.round()}, ${startY.round()})',
                style: const TextStyle(fontSize: 16),
              ),
              Text('End position : (${endX.round()}, ${endY.round()})',
                  style: const TextStyle(fontSize: 16)),
              Text('Current position : (${curX.round()}, ${curY.round()})',
                  style: const TextStyle(fontSize: 16)),
              Text('Displacement : ${disp.round()}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(
                  'Elapsed Time: ${double.parse((elapsedTime).toStringAsFixed(1))} seconds',
                  style: const TextStyle(fontSize: 16)),
              Text(
                  'Time Passed: ${double.parse((timePassed).toStringAsFixed(1))} seconds',
                  style: const TextStyle(fontSize: 16)),
              Text('List of distances: $distTrack',
                  style: const TextStyle(fontSize: 16)),
              Text('Total Distance: $totalDistance',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
