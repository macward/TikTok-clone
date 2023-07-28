//
//  Notifications.swift
//  TikTokClone
//
//  Created by Max Ward on 27/07/2023.
//

import Foundation

extension NSNotification {
    static let playVideo = Notification.Name.init("play_video")
}

class Notify {
    static func playNewVideo(id: String) {
        NotificationCenter.default.post(name: NSNotification.playVideo,
                                        object: nil,
                                        userInfo: ["id": id])
    }
}
