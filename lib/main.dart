import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scrl(),
    ));

class Scrl extends StatefulWidget {
  const Scrl({super.key});

  @override
  State<Scrl> createState() => _ScrlState();
}

class _ScrlState extends State<Scrl> {
  double startX = 0, startY = 0;
  double endX = 0, endY = 0;
  double? dist = 0;
  double disp = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (event) {
          setState(() {
            startX = event.position.dx;
            startY = event.position.dy;
          });
        },
        onPointerUp: (event) {
          setState(() {
            endX = event.position.dx;
            endY = event.position.dy;
            disp = sqrt(pow((startX - endX), 2) + pow((startY - endY), 2));
            print('start : ($startX, $startY)');
            print('end : ($endX, $endY)');
            print('disp : $disp');
            print('---');
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 25, 25, 25),
          child: Center(
              child: Column(
            children: [
              Text('Start position : (${startX.round()}, ${startY.round()})'),
              Text('End position : (${endX.round()}, ${endY.round()})'),
              Text('Displacement : ${disp}')
            ],
          )),
        ));
  }
}
