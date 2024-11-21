
import 'haptics_platform_interface.dart';

class Haptics {
  Future<String?> getPlatformVersion() {
    return HapticsPlatform.instance.getPlatformVersion();
  }
}
