import Flutter
import UIKit

public class HapticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      if #available(iOS 13, *) {
          let haptics = HapticsImpl()
          HapticsSetup.setUp(binaryMessenger: registrar.messenger(), api: haptics)
      } else {
          // Fallback on earlier versions
      };
  }
}
