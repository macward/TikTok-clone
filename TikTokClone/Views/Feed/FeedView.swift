//
//  FeedView.swift
//  TikTokClone
//
//  Created by Max Ward on 24/07/2023.
//

import SwiftUI
import AVKit

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    @State private var scrollProgress: CGFloat = .zero
    @State private var blockNotification: Bool = false
    
    @EnvironmentObject var feedManager: FeedManager
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<viewModel.feedVideoItems.count, id: \.self) { index in
                            viewModel.feedVideoItems[index]
                                .edgesIgnoringSafeArea(.top)
                                .containerRelativeFrame([.horizontal, .vertical])
                                .offsetY { rect in
                                    if index == viewModel.currentIndex {
                                        // rect.midY and proxy.size.height are the same
                                        let centerOffset = rect.midY - (proxy.size.height / 2)
                                        let progress = centerOffset / (proxy.size.height / 2)
                                        
                                        if Double(1.6)...Double(1.9) ~= progress {
                                            blockNotification = true
                                            viewModel.prevVideo()
                                        } else if Double(-1.9)...Double(-1.6) ~= progress {
                                            blockNotification = true
                                            viewModel.nextVideo()
                                        }
                                    }
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea()
            }
            .overlay {
                // top bar
                TopBarView()
            }
            // Fake Tab
            FakeTabView()
        }
        .overlay(content: {
            Image("overlay_original")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0)
        })
        .background(Color.black)
        .ignoresSafeArea()
        .onAppear() {
            viewModel.addSubscriber()
            //viewModel.fetchInfo()
        }
        .task {
            await viewModel.getFeedData()
        }
    }
}

#Preview {
    FeedView()
}
