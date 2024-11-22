import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/haptics.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/Haptics.swift',
  swiftOptions: SwiftOptions(),
  kotlinOut: 'android/src/main/kotlin/com/example/haptics/Haptics.kt',
  kotlinOptions: KotlinOptions(),
))
@HostApi()
abstract class Haptics {
  bool supportsHaptics();

  void initHaptics();

  void loadPattern(String data);

  void start();

  void stop();

  void setPlaybackRate(double value);

  void setLoopEnabled(bool value);
}

// dart run pigeon --input pigeons/haptics.dart --dart_out lib/haptics.dart
