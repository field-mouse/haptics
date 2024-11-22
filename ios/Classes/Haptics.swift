// Autogenerated from Pigeon (v22.6.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

private class HapticsPigeonCodecReader: FlutterStandardReader {
}

private class HapticsPigeonCodecWriter: FlutterStandardWriter {
}

private class HapticsPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return HapticsPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return HapticsPigeonCodecWriter(data: data)
  }
}

class HapticsPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = HapticsPigeonCodec(readerWriter: HapticsPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol Haptics {
  func supportsHaptics() throws -> Bool
  func initHaptics() throws
  func loadPattern(data: String) throws
  func start() throws
  func stop() throws
  func setPlaybackRate(value: Double) throws
  func setLoopEnabled(value: Bool) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class HapticsSetup {
  static var codec: FlutterStandardMessageCodec { HapticsPigeonCodec.shared }
  /// Sets up an instance of `Haptics` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: Haptics?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let supportsHapticsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.supportsHaptics\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      supportsHapticsChannel.setMessageHandler { _, reply in
        do {
          let result = try api.supportsHaptics()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      supportsHapticsChannel.setMessageHandler(nil)
    }
    let initHapticsChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.initHaptics\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      initHapticsChannel.setMessageHandler { _, reply in
        do {
          try api.initHaptics()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      initHapticsChannel.setMessageHandler(nil)
    }
    let loadPatternChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.loadPattern\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      loadPatternChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let dataArg = args[0] as! String
        do {
          try api.loadPattern(data: dataArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      loadPatternChannel.setMessageHandler(nil)
    }
    let startChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.start\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startChannel.setMessageHandler { _, reply in
        do {
          try api.start()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startChannel.setMessageHandler(nil)
    }
    let stopChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.stop\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      stopChannel.setMessageHandler { _, reply in
        do {
          try api.stop()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      stopChannel.setMessageHandler(nil)
    }
    let setPlaybackRateChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.setPlaybackRate\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setPlaybackRateChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let valueArg = args[0] as! Double
        do {
          try api.setPlaybackRate(value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setPlaybackRateChannel.setMessageHandler(nil)
    }
    let setLoopEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.haptics.Haptics.setLoopEnabled\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setLoopEnabledChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let valueArg = args[0] as! Bool
        do {
          try api.setLoopEnabled(value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setLoopEnabledChannel.setMessageHandler(nil)
    }
  }
}
