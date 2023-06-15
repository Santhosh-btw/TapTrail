// import 'dart:developer';

import 'package:flutter/material.dart';
import 'distance.dart';

// import 'package:flutter_background_service/flutter_background_service.dart';

void main() {
  // FlutterBackgroundService().invoke('setAsForeground');

  // final service = FlutterBackgroundService();
  // service.startService();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const Scrl(),
  ));
}
