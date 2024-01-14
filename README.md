# SwiftUI Video Player App

## Introduction
This SwiftUI app features a video player with dynamic content loading. It includes controls for previous, play/pause, and next actions. The app handles loading states, displays error messages and ensures a smooth user experience.

## Installation
To run the app, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## Features
- Video player with dynamic content loading.
- Controls for previous, play/pause, and next actions.
- Handling loading states with a progress view.
- Displaying error messages for failed video fetching.

## Usage
1. Launch the app.
2. Observe the progress view while videos are being fetched.
3. Explore the video player with dynamically loaded content.
4. Experience error messages when video fetching fails.

## Code Structure
- **`ContentView`**: SwiftUI view displaying the main content of the app.
- **`VideoPlayerViewModel`**: ViewModel managing the state and behavior of the video player.
- **`VideoPlayerParentView`**: UIViewRepresentable bridging SwiftUI and UIKit for the video player.
- **`VideoPlayerView`**: SwiftUI view managing the video player and its controls.
- **`PlayerControlsView`**: SwiftUI view handling controls for the video player.
- **`VideoDataHandler`**: Singleton class for handling video data fetching.
- **`PlayerControlsTimer`**: Class managing a timer for controlling the visibility of player controls.

## Contact
For questions or feedback, feel free to contact the project maintainer:

- Abhijit Singh
- kanwarabhijitsingh@gmail.com
