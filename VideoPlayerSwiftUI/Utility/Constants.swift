//
//  Constants.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import Foundation

/// Struct to encapsulate hardcoded constants used across the app
struct Constants {
    
    static let apiUrl = URL(string: "http://localhost:4000/videos")
    static let invalidApiEndpointMessage = "Shame on us! We'll get the server running again soon"
    static let noVideosFoundMessage = "No videos available"
    static let errorText = "Error"
    
}
