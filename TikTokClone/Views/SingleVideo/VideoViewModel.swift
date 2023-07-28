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
    @Published var videoPlayer: AVQueuePlayer
    private var playerLooper: AVPlayerLooper
    
    // Class initializer. Receives a VideoScheme object and creates a VideoViewModel.
    init(videoPlayer: AVQueuePlayer, video: VideoScheme) {
        self.video = video
        self.videoPlayer = videoPlayer
        self.playerLooper = AVPlayerLooper(player: videoPlayer, templateItem: AVPlayerItem(url: video.bundleUrl))
    }
    
    // Function to start video playback.
    func play() {
        self.videoPlayer.play()
    }
    
    // Function to pause video playback.
    func pause() {
        self.videoPlayer.pause()
    }
    
}
