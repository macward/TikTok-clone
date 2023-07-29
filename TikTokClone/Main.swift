//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by Max Ward on 24/07/2023.
//

import SwiftUI

class FeedManager: ObservableObject {
    @Published var currentVideo: VideoScheme?
}

@main
struct TikTokCloneApp: App {
    var body: some Scene {
        
        @StateObject var feedManager = FeedManager()
        
        WindowGroup {
            FeedView()
                .preferredColorScheme(.dark)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification), perform: { _ in
                    URLCache.shared.removeAllCachedResponses()
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    print("UIApplication: Background")
                    URLCache.shared.removeAllCachedResponses()
                })
                .environmentObject(feedManager)
        }
    }
}
