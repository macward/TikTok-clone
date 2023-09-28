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
    private var subscriptions = Set<AnyCancellable>()
    private var numberOfVideosToLoad: Int = 2
    private var maxIndexLoaded: Int = 0
    private var videoModelList: [VideoScheme] = []
    
    func addSubscriber() {
        
        $currentIndex
            .receive(on: DispatchQueue.main)
            .sink { newValue in
                if newValue < 0 { return }
                self.appendVideo()
                self.playVideoWith(index: newValue)
            }
            .store(in: &subscriptions)
        
        $feedVideoItems
            .receive(on: DispatchQueue.global(qos: .userInitiated))
            .sink { newValue in
                if newValue.count == 0 { return }
            }
            .store(in: &subscriptions)
    }
    
    private func appendVideo() {
        let nextIndex = (self.currentIndex % videoModelList.count) + self.numberOfVideosToLoad
        if self.feedVideoItems.count <= videoModelList.count &&
            nextIndex < (videoModelList.count) &&
            nextIndex > self.maxIndexLoaded {
            self.maxIndexLoaded = nextIndex
            let viewModel: VideoViewModel = .init(videoPlayer: AVQueuePlayer(),
                                                  video: videoModelList[nextIndex])
            self.feedVideoItems.append(.init(viewModel: viewModel))
        }
    }
    
    func nextVideo() {
        if currentIndex == (feedVideoItems.count - 1) { return }
        currentIndex.increase()
    }
    
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
        for index in 0..<numberOfVideosToLoad {
            let videoPlayer = AVQueuePlayer()
            let viewModel = VideoViewModel(videoPlayer: videoPlayer, video: videoModelList[index])
            feedVideoItems.append(VideoView(viewModel: viewModel))
        }
        self.currentIndex = .zero
    }
    
    func getFeedData() async {
        do {
            self.videoModelList = try await Api.feed()
            self.fetchInfo()
        } catch NetworkError.BadFormat {
            print("Bad format")
        } catch NetworkError.BadResponse {
            print("Bad response")
        } catch {
            print("Unknown error")
        }
    }

}
