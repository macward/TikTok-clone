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

extension VideoScheme {
    static let sample: [VideoScheme] = [
        VideoScheme(username: "user1", description: "Amazing travel adventure!", hashtags: "travel, adventure", videoUrl: "01"),
        VideoScheme(username: "user2", description: "Cute kittens playing!", hashtags: "animals, kittens", videoUrl: "02"),
        VideoScheme(username: "user3", description: "Delicious cooking recipe!", hashtags: "cooking, recipe", videoUrl: "03"),
        VideoScheme(username: "user4", description: "Incredible nature scenery!", hashtags: "nature,scenery", videoUrl: "04"),
        VideoScheme(username: "user5", description: "Hilarious comedy skit!", hashtags: "comedy, funny", videoUrl: "05"),
        VideoScheme(username: "user6", description: "Fascinating science experiment!", hashtags: "science, experiment", videoUrl: "06"),
        VideoScheme(username: "user7", description: "Breathtaking drone footage!", hashtags: "drones, aerial", videoUrl: "07"),
        VideoScheme(username: "user8", description: "Artistic drawing time-lapse!", hashtags: "art, drawing", videoUrl: "08"),
        VideoScheme(username: "user9", description: "Fitness workout routine!", hashtags: "fitness, workout", videoUrl: "09"),
        VideoScheme(username: "user10", description: "Mesmerizing music performance!", hashtags: "music, performance", videoUrl: "10"),
        VideoScheme(username: "user1", description: "Amazing travel adventure!", hashtags: "travel, adventure", videoUrl: "01"),
        VideoScheme(username: "user2", description: "Cute kittens playing!", hashtags: "animals, kittens", videoUrl: "02"),
        VideoScheme(username: "user3", description: "Delicious cooking recipe!", hashtags: "cooking, recipe", videoUrl: "03"),
        VideoScheme(username: "user4", description: "Incredible nature scenery!", hashtags: "nature,scenery", videoUrl: "04"),
        VideoScheme(username: "user5", description: "Hilarious comedy skit!", hashtags: "comedy, funny", videoUrl: "05"),
        VideoScheme(username: "user6", description: "Fascinating science experiment!", hashtags: "science, experiment", videoUrl: "06"),
        VideoScheme(username: "user7", description: "Breathtaking drone footage!", hashtags: "drones, aerial", videoUrl: "07"),
        VideoScheme(username: "user8", description: "Artistic drawing time-lapse!", hashtags: "art, drawing", videoUrl: "08"),
        VideoScheme(username: "user9", description: "Fitness workout routine!", hashtags: "fitness, workout", videoUrl: "09"),
        VideoScheme(username: "user10", description: "Mesmerizing music performance!", hashtags: "music, performance", videoUrl: "10"),
    ]
    
    static let sampleMix: [VideoScheme] = [
        VideoScheme(username: "user1", description: "Amazing travel adventure!", hashtags: "travel, adventure", videoUrl: "https://firebasestorage.googleapis.com/v0/b/switchat-1d16f.appspot.com/o/tiktok%2F1690354076523.mp4?alt=media&token=af92816e-3af4-4961-ab7a-792b440e5309"),
        VideoScheme(username: "user2", description: "Cute kittens playing!", hashtags: "animals, kittens", videoUrl: "https://firebasestorage.googleapis.com/v0/b/switchat-1d16f.appspot.com/o/tiktok%2F1690354152141.mp4?alt=media&token=26f036a2-b16a-413e-bc4b-022497860923"),
        VideoScheme(username: "user3", description: "Delicious cooking recipe!", hashtags: "cooking, recipe", videoUrl: "http://192.168.0.129:8000/storage/3.mp4"),
        VideoScheme(username: "user4", description: "Incredible nature scenery!", hashtags: "nature,scenery", videoUrl: "http://192.168.0.129:8000/storage/4.mp4"),
        VideoScheme(username: "user5", description: "Hilarious comedy skit!", hashtags: "comedy, funny", videoUrl: "http://192.168.0.129:8000/storage/5.mp4"),
        VideoScheme(username: "user6", description: "Fascinating science experiment!", hashtags: "science, experiment", videoUrl: "http://192.168.0.129:8000/storage/6.mp4"),
        VideoScheme(username: "user7", description: "Breathtaking drone footage!", hashtags: "drones, aerial", videoUrl: "http://192.168.0.129:8000/storage/7.mp4"),
        VideoScheme(username: "user8", description: "Artistic drawing time-lapse!", hashtags: "art, drawing", videoUrl: "http://192.168.0.129:8000/storage/8.mp4"),
        VideoScheme(username: "user9", description: "Fitness workout routine!", hashtags: "fitness, workout", videoUrl: "http://192.168.0.129:8000/storage/9.mp4"),
        VideoScheme(username: "user10", description: "Mesmerizing music performance!", hashtags: "music, performance", videoUrl: "http://192.168.0.129:8000/storage/10.mp4")
    ]

}
