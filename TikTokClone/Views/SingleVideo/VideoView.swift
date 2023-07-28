//
//  FeedVideoView.swift
//  TikTokClone
//
//  Created by Max Ward on 25/07/2023.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @State private var isMoving: Bool = false
    var viewModel: VideoViewModel!
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ZStack {
                    // Display the video player using the videoPlayerFor() view builder.
                    videoPlayerFor()
                    
                    // Display a video overlay using the VideoOvelay() view builder with opacity based on isMoving state.
                    VideoOvelay(video: viewModel.video)
                        .opacity(!isMoving ? 1 : 0.5)
                }
                .background(Color.black)
                // Display the suggestion bar overlay at the bottom of the video view.
                .overlay(alignment: .bottom) {
                    suggestionBar("Search Messi inter de Miami")
                }
            }
        }
        // Track if the view is moving up or down and set the isMoving state accordingly.
        .offsetY { rect in
            if rect.minY < 0 {
                self.isMoving = true
            } else {
                isMoving = false
            }
        }
    }
    
    // View builder function to conditionally display the video player.
    @ViewBuilder
    private func videoPlayerFor() -> some View {
        VideoLayerView(player: viewModel.videoPlayer)
    }
    
    // View builder function to display the suggestion bar at the bottom of the video view.
    @ViewBuilder
    func suggestionBar(_ text: String) -> some View {
        HStack {
            Text(text)
                .padding(.leading)
                .padding(.vertical, 8)
                .font(.system(size: 12))
            Spacer()
            Image(systemName: "chevron.forward")
                .font(.system(size: 12))
                .padding(.trailing)
        }
        .foregroundStyle(Color.white)
        .background(Color.gray.opacity(0.2))
    }
}

//#Preview {
//    VideoView(viewModel: VideoViewModel(video: VideoScheme.sample.first!))
//}
