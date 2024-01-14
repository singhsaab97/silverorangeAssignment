//
//  PlayerControlsView.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import SwiftUI

/// SwiftUI view representing custom player controls layered over the video player
struct PlayerControlsView: View {
    
    @StateObject var viewModel: VideoPlayerViewModel
    
    @Binding var opacity: Double
    
    var body: some View {
        HStack(spacing: 30) {
            Button(action: viewModel.previousButtonTapped) {
                Image("previous")
                    .frame(width: 40, height: 40)
            }
            .disabled(viewModel.isPreviousButtonDisabled)
            .buttonStyle(PlayerControlButtonStyle())
            
            Button(action: viewModel.playPauseButtonTapped) {
                Image(viewModel.isPlaying ? "pause" : "play")
                    .frame(width: 60, height: 60)
            }
            .buttonStyle(PlayerControlButtonStyle())
            
            Button(action: viewModel.nextButtonTapped) {
                Image("next")
                    .frame(width: 40, height: 40)
            }
            .disabled(viewModel.isNextButtonDisabled)
            .buttonStyle(PlayerControlButtonStyle())
        }
        .opacity(opacity)
    }
    
}
