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
    @State private var gesture: UIGestureRecognizer?
    
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
                                        // rect.midY and proxy.size.height are the same
                                        let centerOffset = rect.midY - (proxy.size.height / 2)
                                        let progress = centerOffset / (proxy.size.height / 2)
                                        if Double(1.6)...Double(1.9) ~= progress {
                                            if gesture?.state != .ended { return }
                                            viewModel.prevVideo()
                                        } else if Double(-1.9)...Double(-1.6) ~= progress {
                                            if gesture?.state != .ended { return }
                                            viewModel.nextVideo()
                                        }
                                    }
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .background {
                    CustomGesture {
                        gesture = $0
                        //viewModel.handleGesture($0)
                    }
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
    
    func handleState(_ gesture: UIPanGestureRecognizer) {
//        let offsetY = gesture.translation(in: gesture.view).y
//        if offsetY > 0 && gesture.state == .ended {
//            viewModel.prevVideo()
//        } else if offsetY < 0 && gesture.state == .ended {
//            viewModel.nextVideo()
//        }
    }
}

#Preview {
    FeedView(viewModel: FeedViewModel())
}
