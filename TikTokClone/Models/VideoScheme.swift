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
    var hashtags: [String]
    var videoUrl: String
    var likeCount: Int = Int.random(in: 0...3000)
    var commentCount: Int = Int.random(in: 0...3000)
    var shareCount: Int = Int.random(in: 0...3000)
    var viewCunt: Int = Int.random(in: 0...3000)
}

extension VideoScheme {
    var bundleUrl: URL {
        Bundle.main.url(forResource: self.videoUrl, withExtension: "mp4")!
    }
}

extension VideoScheme {
    static let sample: [VideoScheme] = [
        VideoScheme(username: "user1", description: "Amazing travel adventure!", hashtags: ["travel", "adventure"], videoUrl: "01"),
        VideoScheme(username: "user2", description: "Cute kittens playing!", hashtags: ["animals", "kittens"], videoUrl: "02"),
        VideoScheme(username: "user3", description: "Delicious cooking recipe!", hashtags: ["cooking", "recipe"], videoUrl: "03"),
        VideoScheme(username: "user4", description: "Incredible nature scenery!", hashtags: ["nature", "scenery"], videoUrl: "04"),
        VideoScheme(username: "user5", description: "Hilarious comedy skit!", hashtags: ["comedy", "funny"], videoUrl: "05"),
        VideoScheme(username: "user6", description: "Fascinating science experiment!", hashtags: ["science", "experiment"], videoUrl: "06"),
        VideoScheme(username: "user7", description: "Breathtaking drone footage!", hashtags: ["drones", "aerial"], videoUrl: "07"),
        VideoScheme(username: "user8", description: "Artistic drawing time-lapse!", hashtags: ["art", "drawing"], videoUrl: "08"),
        VideoScheme(username: "user9", description: "Fitness workout routine!", hashtags: ["fitness", "workout"], videoUrl: "09"),
        VideoScheme(username: "user10", description: "Mesmerizing music performance!", hashtags: ["music", "performance"], videoUrl: "10"),
        VideoScheme(username: "user1", description: "Amazing travel adventure!", hashtags: ["travel", "adventure"], videoUrl: "01"),
        VideoScheme(username: "user2", description: "Cute kittens playing!", hashtags: ["animals", "kittens"], videoUrl: "02"),
        VideoScheme(username: "user3", description: "Delicious cooking recipe!", hashtags: ["cooking", "recipe"], videoUrl: "03"),
        VideoScheme(username: "user4", description: "Incredible nature scenery!", hashtags: ["nature", "scenery"], videoUrl: "04"),
        VideoScheme(username: "user5", description: "Hilarious comedy skit!", hashtags: ["comedy", "funny"], videoUrl: "05"),
        VideoScheme(username: "user6", description: "Fascinating science experiment!", hashtags: ["science", "experiment"], videoUrl: "06"),
        VideoScheme(username: "user7", description: "Breathtaking drone footage!", hashtags: ["drones", "aerial"], videoUrl: "07"),
        VideoScheme(username: "user8", description: "Artistic drawing time-lapse!", hashtags: ["art", "drawing"], videoUrl: "08"),
        VideoScheme(username: "user9", description: "Fitness workout routine!", hashtags: ["fitness", "workout"], videoUrl: "09"),
        VideoScheme(username: "user10", description: "Mesmerizing music performance!", hashtags: ["music", "performance"], videoUrl: "10")
    ]
}
