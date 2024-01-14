//
//  VideoModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import Foundation

/// Struct representing video details
struct Video: Codable {
    let title: String
    let author: Author
    var hlsPath: String?
    var videoPath: String?
    var description: String?
    var publishDate: String?
    
    var playableUrl: URL? {
        guard let path = videoPath ?? hlsPath else { return nil }
        return URL(string: path)
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case author
        case hlsPath = "hlsURL"
        case videoPath = "fullURL"
        case description
        case publishDate = "publishedAt"
    }
    
}

/// Struct representing an author
struct Author: Codable {
    let name: String
}
