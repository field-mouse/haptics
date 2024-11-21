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
  bool isSupported();
}

// dart run pigeon --input pigeons/haptics.dart --dart_out lib/haptics.dart
