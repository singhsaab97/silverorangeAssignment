//
//  PlayerControlsTimer.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import Foundation

typealias PlayerControlsCallback = (() -> Void)

/// A class managing a timer for controlling the player controls visibility
final class PlayerControlsTimer: ObservableObject {
    
    @Published var timer: Timer?
    
    var callback: PlayerControlsCallback?
    
}

// MARK: - Exposed Helpers
extension PlayerControlsTimer {
    
    // Start the timer with a specified callback
    func start(callback: PlayerControlsCallback?) {
        self.callback = callback
        stop()
        timer = Timer.scheduledTimer(
            withTimeInterval: Constants.playerControlsFadeInterval,
            repeats: false,
            block: { [weak self] _ in
                self?.callback?()
            })
    }
    
    // Restart the timer
    func restart() {
        stop()
        start(callback: callback)
    }
    
    // Stop the timer
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
}
