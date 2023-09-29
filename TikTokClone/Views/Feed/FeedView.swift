//
//  FeedView.swift
//  TikTokClone
//
//  Created by Max Ward on 24/07/2023.
//

import SwiftUI
import AVKit

struct FeedView: View {
    
    @ObservedObject private var viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
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
                                        let centerOffset = rect.midY - (proxy.size.height / 2)
                                        let progress = centerOffset / (proxy.size.height / 2)
                                        if Double(1.6)...Double(1.9) ~= progress {
                                            viewModel.prevVideo()
                                        } else if Double(-1.9)...Double(-1.6) ~= progress {
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
        }
        .task {
            await viewModel.getFeedData()
        }
    }
}

#Preview {
    FeedView(viewModel: FeedViewModel())
}
