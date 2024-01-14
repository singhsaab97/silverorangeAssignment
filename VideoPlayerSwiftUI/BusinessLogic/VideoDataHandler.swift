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
    
    /// Determines the mock result type
    enum MockResult {
        case success
        case failure
        case notApplicable
    }
    
    static let shared = VideoDataHandler()
    
    func fetchVideos(isMockRequest: Bool, result: MockResult = .notApplicable, completion: @escaping VideosFetchCompletionHandler) {
        guard !isMockRequest else {
            switch result {
            case .success:
                if let path = Bundle.main.path(forResource: "Videos", ofType: "json"),
                   let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                    do {
                        // Decode JSON to an array of codable Video model
                        let videos = try JSONDecoder().decode([Video].self, from: jsonData)
                        completion(videos, nil)
                    } catch {
                        completion([], error.localizedDescription)
                    }
                }
            case .failure:
                completion([], Constants.noVideosFoundMessage)
            case .notApplicable:
                // This case will never be executed
                completion([], Constants.noVideosFoundMessage)
            }
            return
        }
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
