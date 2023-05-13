import 'package:flutter/material.dart';

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
  int presses = 0;
  int releases = 0;
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (event) {
          setState(() {
            presses++;
          });
        },
        onPointerMove: (event) => setState(() {
              x = event.position.dx;
              y = event.position.dy;
            }),
        onPointerUp: (event) => setState(() {
              releases++;
            }),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Center(
              child: Column(
            children: [
              Text('Number of presses : $presses'),
              Text('Number of releases : $releases'),
              Text('Cursor positions : (${x.round()}, ${y.round()})')
            ],
          )),
        ));
  }
}
