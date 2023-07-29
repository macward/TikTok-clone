//
//  VideoViewModel.swift
//  TikTokClone
//
//  Created by Max Ward on 27/07/2023.
//

import Foundation
import AVKit
import Combine


class VideoViewModel: ObservableObject {
    
    var video: VideoScheme
    private var player: AVQueuePlayer
    private var playerLooper: AVPlayerLooper
    @Published var isPlaying: Bool = true
    private var cancellable = Set<AnyCancellable>()
    
    // Class initializer. Receives a VideoScheme object and creates a VideoViewModel.
    init(videoPlayer: AVQueuePlayer, video: VideoScheme) {
        self.video = video
        self.player = videoPlayer
        self.playerLooper = AVPlayerLooper(player: videoPlayer, templateItem: AVPlayerItem(url: video.bundleUrl))
    }
    
    // Function to start video playback.
    func play() {
        self.player.play()
        isPlaying = true
    }
    
    // Function to pause video playback.
    func pause() {
        self.player.pause()
        isPlaying = false
    }
    
    func playerInstance() -> AVQueuePlayer {
        return self.player
    }
    
    func toggleVideo() {
        if isPlaying {
            self.pause()
        } else {
            self.play()
        }
    }
    
}
