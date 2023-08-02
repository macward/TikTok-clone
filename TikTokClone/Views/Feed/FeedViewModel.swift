//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by Max Ward on 26/07/2023.
//

import Foundation
import AVKit
import Combine
 
class FeedViewModel: ObservableObject {
    
    // MARK: PUBLIC PROPERTIES
    @Published var currentIndex: Int = -1
    @Published var feedVideoItems: [VideoView] = []
    
    // MARK: PRIVATE PROPERTIES
    private var cancellables = Set<AnyCancellable>()
    private var listOffset: Int = 4
    
    func addSubscriber() {
        
        $currentIndex
            .receive(on: DispatchQueue.main)
            .sink { newValue in
                if newValue < 0 { return }
                self.playVideoWith(index: newValue)
            }
            .store(in: &cancellables)
        
        $feedVideoItems
            .receive(on: DispatchQueue.global(qos: .userInitiated))
            .sink { newValue in
                if newValue.count == 0 { return }
            }
            .store(in: &cancellables)
    }
    
    private func appendVideo() {
        let viewModel: VideoViewModel = .init(videoPlayer: AVQueuePlayer(),
                                              video: VideoScheme.sample[(currentIndex % VideoScheme.sample.count) + listOffset])
        feedVideoItems.append(.init(viewModel: viewModel))
    }
    
    // Function to move to the next video in the feed.
    // If already at the last video, does nothing.
    // Notifies Notify.playNewVideo with the ID of the new video being loaded.
    func nextVideo() {
        if currentIndex == (feedVideoItems.count - 1) { return }
        currentIndex.increase()
        
        print("index: \(self.currentIndex) - items count \(self.feedVideoItems.count) - \(VideoScheme.sample.count)")
        
        let nextIndex = currentIndex + listOffset
        if nextIndex < VideoScheme.sample.count && feedVideoItems.count <= VideoScheme.sample.count {
            self.appendVideo()
        }
    }
    
    // Function to move to the previous video in the feed.
    // If already at the first video, does nothing.
    // Notifies Notify.playNewVideo with the ID of the new video being loaded.
    func prevVideo() {
        if currentIndex == .zero { return }
        currentIndex.decrease()
    }
    
    private func pauseAllVideos() {
        feedVideoItems.forEach { view in
            view.viewModel.pause()
        }
    }
    
    private func playVideoWith(index: Int) {
        pauseAllVideos()
        feedVideoItems[currentIndex].viewModel.play()
    }
    
    func fetchInfo() {
        for index in 0..<listOffset {
            let videoPlayer = AVQueuePlayer()
            let viewModel = VideoViewModel(videoPlayer: videoPlayer, video: VideoScheme.sample[index])
            feedVideoItems.append(VideoView(viewModel: viewModel))
        }
        self.currentIndex = .zero
    }

}
