//
//  FeedItemActionsBar.swift
//  TikTokClone
//
//  Created by Max Ward on 25/07/2023.
//

import SwiftUI

struct VideoOvelay: View {
    
    var video: VideoScheme
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack (alignment: .leading, spacing: 8) {
                    Spacer()
                    Text(video.username)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(video.description)
                        .font(.system(size: 16))
                }
                .foregroundColor(Color.white)
                .padding(.trailing, 32)
                Spacer()
                VStack(spacing: 20) {
                    Spacer()
                    profileImage("profile_placeholder")
                    feedIcon("like", text: "1.2M")
                    feedIcon("comments", text: "10.7M")
                    feedIcon("share", text: "30.2K")
                    Image("music_disc")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            suggestionBar("Search Mess at inter Miami")
        }
    }
    
    @ViewBuilder
    func feedIcon(_ icon: String, text: String) -> some View {
        VStack {
            Image(icon)
                .iconFeedStyle()
            Text(text)
                .iconFeedTextStyle()
        }
    }
    
    @ViewBuilder
    func profileImage(_ image: String) -> some View {
        Image(image)
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundStyle(Color.white)
            }
            .overlay (alignment: .bottom) {
                ZStack {
                    Circle()
                        .fill(Color("AccentColor"))
                        .frame(width: 15, height: 15)
                    Image(systemName: "plus")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                        .foregroundColor(Color.white)
                }
                .offset(x: 0, y: 7)
            }
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

#Preview {
    VideoOvelay(video: VideoScheme.sample[0])
        .background(Color.blue)
}
