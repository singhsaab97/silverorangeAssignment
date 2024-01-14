//
//  VideoPlayerViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import Foundation

final class VideoPlayerViewModel: ObservableObject {
    
    @Published private var videos = [Video]()
    @Published private var currentVideoIndex: Int = 0
        
}

// MARK: - Exposed Helpers
extension VideoPlayerViewModel {
    
    var currentVideo: Video? {
        // TODO: - Return the video at current index
        return nil
    }
    
    func progressViewAppeared() {
        // TODO: - Prepare to play the video track
    }
    
    func videoPlayerAppeared() {
        fetchVideos()
    }
    
    func previousButtonTapped() {
        // TODO
    }
    
    func playPauseButtonTapped() {
        // TODO
    }
    
    func nextButtonTapped() {
        // TODO
    }
    
}

// MARK: - Private Helpers
private extension VideoPlayerViewModel {
    
    func fetchVideos() {
        // TODO: - Make a network call to fetch videos from the server
    }
    
}
