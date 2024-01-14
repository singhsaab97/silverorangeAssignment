//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI
import MarkdownUI

struct ContentView: View {
    
    @StateObject private var viewModel = VideoPlayerViewModel(isMockRequest: false)
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.currentVideo == nil {
                    // Display a progress view while fetching videos
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            viewModel.progressViewAppeared()
                        }
                } else if let errorMessage = viewModel.errorMessage {
                    // Display an error message if fetching videos fails
                    Text(errorMessage)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.red)
                        .multilineTextAlignment(.center)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                        )
                } else {
                    // Display the video player and related information
                    VideoPlayerParentView(viewModel: viewModel)
                        .onAppear {
                            viewModel.videoPlayerAppeared()
                        }
                        .navigationBarTitle(
                            viewModel.navigationTitle,
                            displayMode: .inline
                        )
                        .frame(height: 250)
                    
                    if let video = viewModel.currentVideo {
                        ScrollView {
                            VStack(alignment: .center, spacing: 16) {
                                Text(video.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(video.author.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                
                                Markdown(video.description ?? String())
                            }
                            .padding([.leading, .trailing], 10)
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
