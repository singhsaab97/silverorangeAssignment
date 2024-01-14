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
    
    @ObservedObject var viewModel: VideoPlayerViewModel
            
    var body: some View {
        ZStack {
            VideoPlayer(player: viewModel.player)
            
            // TODO: - Add player controls view on top of the video player
        }
    }
    
}
