//
//  FeedItemModel.swift
//  TikTokClone
//
//  Created by Max Ward on 25/07/2023.
//

import Foundation

struct VideoScheme: Codable, Identifiable, Equatable {
    var id: String = UUID().uuidString
    var username: String
    var description: String
    var hashtags: String
    var videoUrl: String
    var likeCount: Int = Int.random(in: 0...3000)
    var commentCount: Int = Int.random(in: 0...3000)
    var shareCount: Int = Int.random(in: 0...3000)
    var viewCount: Int = Int.random(in: 0...3000)
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case description
        case hashtags
        case videoUrl = "video_url"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case shareCount = "share_count"
        case viewCount = "view_count"
    }
}

extension VideoScheme {
    var bundleUrl: URL {
        Bundle.main.url(forResource: self.videoUrl, withExtension: "mp4")!
        //URL(string: self.videoUrl)!
    }
}


