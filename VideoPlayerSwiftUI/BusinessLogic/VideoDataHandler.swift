//
//  VideoDataHandler.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import Foundation
import Alamofire

typealias VideosFetchCompletionHandler = (([Video], String?) -> Void)

/// Singleton class to handle video data
final class VideoDataHandler {
    
    static let shared = VideoDataHandler()
    
    func fetchVideos(completion: @escaping VideosFetchCompletionHandler) {
        // Ensure that the API URL is available
        guard let apiUrl = Constants.apiUrl else {
            completion([], Constants.invalidApiEndpointMessage)
            return
        }
        AF.request(apiUrl, method: .get)
            .validate()
            .responseDecodable(of: [Video].self) { response in
            switch response.result {
            case let .success(videos):
                let errorMessage = videos.isEmpty
                    ? Constants.noVideosFoundMessage
                    : nil
                // Call the completion handler with videos and an optional error message
                completion(videos, errorMessage)
            case let .failure(error):
                // Call the completion handler with an empty array and the error message
                completion([], error.localizedDescription)
            }
        }
    }
    
}
