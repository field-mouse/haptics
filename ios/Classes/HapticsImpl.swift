//
//  HapticsImpl.swift
//  Pods
//
//  Created by VS on 11/22/24.
//

import CoreHaptics

@available(iOS 13, *)
class HapticsImpl: Haptics {
    private var engine: CHHapticEngine?
    private var player: CHHapticAdvancedPatternPlayer?
    
    private var playbackRate: Float = 1.0
    private var loopEnabled: Bool = false
    
    func supportsHaptics() throws -> Bool {
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        return hapticCapability.supportsHaptics
    }
    
    func initHaptics() throws {
        engine = try CHHapticEngine()
    }
    
    func loadPattern(data: String) throws {
        let pattern = try preparePattern(data: data)
        player = try engine?.makeAdvancedPlayer(with: pattern)
        player?.loopEnabled = true
        player?.playbackRate = playbackRate
        player?.loopEnabled = loopEnabled
        try engine?.start()
    }
    
    func start() throws {
        try player?.start(atTime: CHHapticTimeImmediate)
    }
    
    func stop() throws {
        try player?.stop(atTime: CHHapticTimeImmediate)
    }
    
    func setPlaybackRate(value: Double) throws {
        playbackRate = Float(value)
        player?.playbackRate = playbackRate
    }
    
    func setLoopEnabled(value: Bool) throws {
        loopEnabled = value
        player?.loopEnabled = value
    }
    
    private func preparePattern(data: String) throws -> CHHapticPattern {
        let dict = try JSONSerialization.jsonObject(with: Data(data.utf8), options: []) as! Dictionary<CHHapticPattern.Key, Any>
        return try CHHapticPattern(dictionary: dict)
    }
}
