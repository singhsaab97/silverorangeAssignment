//
//  VideoPlayerParentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Abhijit Singh on 13/01/24.
//

import SwiftUI

/// UIViewRepresentable to integrate VideoPlayerView with SwiftUI view
struct VideoPlayerParentView: UIViewRepresentable {
    
    @StateObject var viewModel: VideoPlayerViewModel
    
    // Bridge between SwiftUI and UIKit
    class Coordinator: NSObject {
        let parent: VideoPlayerParentView
        
        init(parent: VideoPlayerParentView) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    // Create and return the underlying UIKit view
    func makeUIView(context: Context) -> UIView {
        let rootView = VideoPlayerView(viewModel: viewModel)
        // Wrap the SwiftUI view in a UIHostingController to make it a UIView
        let hostingController = UIHostingController(rootView: rootView)
        return hostingController.view!
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Update any UIViewRepresentable configuration here
    }
    
}
