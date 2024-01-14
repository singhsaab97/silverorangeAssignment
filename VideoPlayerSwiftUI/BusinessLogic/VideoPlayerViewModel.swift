//
//  VideoPlayerViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import SwiftUI
import AVKit

/// ViewModel managing the state and behavior of the video player
final class VideoPlayerViewModel: ObservableObject {
    
    @Published private var videos = [Video]()
    @Published private var currentVideoIndex: Int = 0
    
    @Published var isPlaying: Bool = false
    @Published var isPreviousButtonDisabled: Bool = true
    @Published var isNextButtonDisabled: Bool = false
    @Published var errorMessage: String?
    
    @State var player = AVPlayer()
        
}

// MARK: - Exposed Helpers
extension VideoPlayerViewModel {
    
    var navigationTitle: String {
        return Constants.videoPlayerTitle
    }
    
    var currentVideo: Video? {
        return videos[safe: currentVideoIndex]
    }
    
    func progressViewAppeared() {
        fetchVideos()
    }
    
    func videoPlayerAppeared() {
        prepareToPlay()
    }
    
    func previousButtonTapped() {
        guard currentVideoIndex > 0 else { return }
        currentVideoIndex -= 1
        prepareToPlay()
    }
    
    func playPauseButtonTapped() {
        isPlaying.toggle()
        isPlaying ? player.play() : player.pause()
    }
    
    func nextButtonTapped() {
        guard currentVideoIndex < videos.count - 1 else { return }
        currentVideoIndex += 1
        prepareToPlay()
    }
    
}

// MARK: - Private Helpers
private extension VideoPlayerViewModel {
    
    func fetchVideos() {
        VideoDataHandler.shared.fetchVideos { [weak self] (videos, errorMessage) in
            self?.videos = self?.sortVideos(videos) ?? []
            self?.currentVideoIndex = 0
            self?.isPreviousButtonDisabled = true
            self?.isNextButtonDisabled = false
            if let message = errorMessage {
                self?.errorMessage = "\(Constants.errorText): \(message)"
            }
        }
    }
    
    // Method to sort videos based on their publish date
    func sortVideos(_ videos: [Video]) -> [Video] {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return videos.sorted(by: { (current, next) in
            guard let currentDate = current.publishDate,
                  let nextDate = next.publishDate else { return false }
            let currentVideoDate = dateFormatter.date(from: currentDate) ?? Date()
            let nextVideoDate = dateFormatter.date(from: nextDate) ?? Date()
            // Sorted in the order of most recently published
            return currentVideoDate > nextVideoDate
        })
    }
    
    // Prepare the player for playback
    func prepareToPlay() {
        guard let playableUrl = currentVideo?.playableUrl else { return }
        isPlaying = false
        // Disable the previous button at the start of list
        isPreviousButtonDisabled = currentVideoIndex == 0
        // Disable the next button at the end of list
        isNextButtonDisabled = currentVideoIndex == videos.count - 1
        player.replaceCurrentItem(with: AVPlayerItem(url: playableUrl))
        player.pause()
    }
    
}
