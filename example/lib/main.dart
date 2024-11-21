import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:haptics/haptics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _hapticsPlugin = Haptics();

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final pattern = await rootBundle
        .loadString('assets/Assault_M60_Fire.transients.ahap');

    await _hapticsPlugin.initHaptics();
    await _hapticsPlugin.loadPattern(pattern);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Play/Pause'),
            onPressed: () {
              setState(() {
                if (_isPlaying) {
                  _hapticsPlugin.stop();
                  _isPlaying = false;
                } else {
                  _hapticsPlugin.start();
                  _isPlaying = true;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
