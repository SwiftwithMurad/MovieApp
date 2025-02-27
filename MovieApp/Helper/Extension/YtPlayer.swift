//
//  YtPlayer.swift
//  MovieApp
//
//  Created by Mac on 25.02.25.
//

import Foundation
import YouTubeiOSPlayerHelper

extension YTPlayerView {
    func loadVideo(with videoId: String) {
        self.load(withVideoId: videoId,
                  playerVars: ["playsinline": 1])
    }
}

extension UIView {
    func loadVideo(videoId: String) {
        let videoView: YTPlayerView = {
            let view = YTPlayerView()
            return view
        }()
        videoView.loadVideo(with: videoId)
    }
}
