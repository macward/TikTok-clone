//
//  VideoViewModel.swift
//  TikTokClone
//
//  Created by Max Ward on 27/07/2023.
//

import Foundation
import AVKit

class VideoViewModel: ObservableObject {
    
    @Published var video: VideoScheme
    @Published var videoPlayer: AVPlayer?
    
    // Class initializer. Receives a VideoScheme object and creates a VideoViewModel.
    init(videoPlayer: AVPlayer?, video: VideoScheme) {
        self.video = video
        // Initialize the videoPlayer using AVPlayer and AVPlayerItem with the video URL.
        self.videoPlayer = videoPlayer
    }
    
    // Function to start video playback.
    func play() {
        self.videoPlayer?.play()
    }
    
    // Function to pause video playback.
    func pause() {
        self.videoPlayer?.pause()
    }
    
}
