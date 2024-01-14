//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = VideoPlayerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.currentVideo == nil {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            viewModel.progressViewAppeared()
                        }
                } else if let errorMessage = viewModel.errorMessage {
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
                    // TODO: - Create a standalone video player view
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
