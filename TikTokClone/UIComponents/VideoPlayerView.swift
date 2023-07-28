//
//  VideoPlayerView.swift
//  TikTokClone
//
//  Created by Max Ward on 26/07/2023.
//

import UIKit
import AVKit
import SwiftUI

class VideoPlayerView: UIView {
    
    override static var layerClass: AnyClass { AVPlayerLayer.self }
    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer}
    
    var player: AVPlayer? {
        get { playerLayer.player }
        set {
            playerLayer.player = newValue
            playerLayer.videoGravity = .resizeAspectFill
        }
    }
}

struct VideoLayerView: UIViewRepresentable {
    
    let player: AVPlayer?
    
    func makeUIView(context: Context) -> some UIView {
        let view = VideoPlayerView()
        view.player = player
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
