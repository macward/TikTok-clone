//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by Max Ward on 24/07/2023.
//

import SwiftUI

@main
struct TikTokCloneApp: App {
    var body: some Scene {
        WindowGroup {
            FeedView()
                .preferredColorScheme(.dark)
        }
    }
}
