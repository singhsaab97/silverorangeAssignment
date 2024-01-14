//
//  VideoPlayerView.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import SwiftUI
import AVKit

/// VideoPlayerView is a separate view to encapsulate video player and controls
struct VideoPlayerView: View {
    
    @StateObject private var timer = PlayerControlsTimer()
    
    @State private var controlsOpacity: Double = 1
    
    @ObservedObject var viewModel: VideoPlayerViewModel
            
    var body: some View {
        ZStack {
            VideoPlayer(player: viewModel.player)
                .onTapGesture {
                    // Toggle controls visibility with animation on tap
                    withAnimation {
                        controlsOpacity = controlsOpacity == 1 ? 0 : 1
                    }
                    // Start or stop the timer based on controls visibility
                    controlsOpacity == 1
                        ? restartTimer()
                        : timer.stop()
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer.stop()
                }
            
            PlayerControlsView(viewModel: viewModel, opacity: $controlsOpacity)
        }
    }
    
}

// MARK: - Private Helpers
private extension VideoPlayerView {
    
    func startTimer() {
        timer.start {
            // Hide controls with animation when the timer completes
            withAnimation {
                controlsOpacity = 0
            }
        }
    }
    
    func restartTimer() {
        timer.restart()
    }
    
}
