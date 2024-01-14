//
//  VideoPlayerViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import SwiftUI
import AVKit

final class VideoPlayerViewModel: ObservableObject {
    
    @Published private var videos = [Video]()
    @Published private var currentVideoIndex: Int = 0
    
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
        // TODO: - Prepare to play the video track
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
        VideoDataHandler.shared.fetchVideos { [weak self] (videos, errorMessage) in
            self?.videos = self?.sortVideos(videos) ?? []
            self?.currentVideoIndex = 0
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
    
}
