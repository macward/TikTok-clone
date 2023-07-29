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
                    actionIcon("like", text: video.likeCount.description)
                    actionIcon("comments", text: video.commentCount.description)
                    actionIcon("share", text: video.shareCount.description)
                    Image("music_disc")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 14)
            
            // suggestionBar("Search Messi at inter Miami")
        }
    }
    
    @ViewBuilder
    func actionIcon(_ icon: String, text: String) -> some View {
        VStack {
            Image(icon)
                //.iconFeedStyle()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(LinearGradient(colors: [Color.white, Color("PrimaryText")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .black.opacity(0.2), radius: 6, x: 2, y: 2)
            
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
        .background(Color.black.opacity(0.4))
    }
}

#Preview {
    VideoOvelay(video: VideoScheme.sample[0])
        .background(Color.blue)
}
