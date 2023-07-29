//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by Max Ward on 26/07/2023.
//



///Explanation (CHAT GPT)
/*
FeedViewModel is a class that conforms to ObservableObject to allow its published properties to update the views automatically.
The currentIndex property keeps track of the current index in the feed. It's used to know which video is currently being displayed.
The feedVideoItems property is an array of VideoScheme representing the video items in the feed. It's initialized with sample data from VideoScheme.sample.
The createViewModel(for index: Int) function creates a VideoViewModel for a specific index in the feed. This is used to manage individual videos in the feed.
The video(_ index: Int) function retrieves a VideoScheme for a given index in the feed. It returns nil if the index is out of range, which is a safety check.
The nextVideo() function is called to move to the next video in the feed. If it's already at the last video, it does nothing. It notifies Notify.playNewVideo
 */

import Foundation
import AVKit
import Combine
 
class FeedViewModel: ObservableObject {
    
    @Published var currentIndex: Int = -1
    @Published var feedVideoItems: [VideoScheme] = []
    @Published var listOfVideosVM: [VideoViewModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
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
    
    // Function to create and return a VideoViewModel for a specific index in the feed.
    func createViewModel(for index: Int) -> VideoViewModel {
        return listOfVideosVM[index]
    }
    
    // Function to retrieve a VideoScheme for a given index in the feed.
    // Returns nil if the index is out of range.
    func video(_ index: Int) -> VideoScheme? {
        guard index >= 0 && index < feedVideoItems.count else {
            return nil
        }
        return feedVideoItems[index]
    }
    
    // Function to move to the next video in the feed.
    // If already at the last video, does nothing.
    // Notifies Notify.playNewVideo with the ID of the new video being loaded.
    func nextVideo() {
        if currentIndex == (feedVideoItems.count - 1) { return }
        currentIndex.increase()
    }
    
    // Function to move to the previous video in the feed.
    // If already at the first video, does nothing.
    // Notifies Notify.playNewVideo with the ID of the new video being loaded.
    func prevVideo() {
        if currentIndex == .zero { return }
        currentIndex.decrease()
    }
    
    private func pauseAllVideos() {
        listOfVideosVM.forEach { videoViewModel in
            videoViewModel.pause()
        }
    }
    
    private func playVideoWith(index: Int) {
        pauseAllVideos()
        listOfVideosVM[currentIndex].play()
    }
    
    func fetchInfo() async throws {
//        let url = URL(string: "http://192.168.0.129:8000/")!
//        let urlRequest = URLRequest(url: url)
//        let (data, _) = try await URLSession.shared.data(for: urlRequest)
//        let dataObject = try JSONDecoder().decode([VideoScheme].self, from: data)
        
        // Temporal fix
        let dataObject = VideoScheme.sample
        
        for video in dataObject {
            let videoPlayer = AVQueuePlayer()
            let viewModel = VideoViewModel(videoPlayer:videoPlayer, video: video)
            listOfVideosVM.append(viewModel)
        }
        self.feedVideoItems =  dataObject
        self.currentIndex = .zero
    }
}
