//
//  MusicControlView.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class MusicControlView : UIView {
    
    lazy var albumImageImageView : UIImageView = {
        let v: UIImageView = UIImageView().rounded(15).bordered(2, color: .systemBlue)
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    lazy var emptyAlbumImageView : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(systemName: "music.note")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    lazy var songNameLabel : UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .label
        v.text = "Not playing"
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    lazy var artistNameLabel : UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.textColor = .secondaryLabel
        v.text = "Not playing"
        v.font = .systemFont(ofSize: 14)
        return v
    }()
    
    lazy var playPauseButton : UIButton = {
        let v: UIButton = UIButton().rounded(15).bordered(2, color: .systemBlue)
        v.setImage(UIImage(systemName: "play.fill"), for: .normal)
        v.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        return v
    }()
    
    lazy var nextButton : UIButton = {
        let v: UIButton = UIButton().rounded(15).bordered(2, color: .systemBlue)
        v.setImage(UIImage(systemName: "forward.end.alt.fill"), for: .normal)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func customInit() {
        let containerView = UIView()
        addSubviews(emptyAlbumImageView, albumImageImageView, nextButton, playPauseButton, containerView)
        albumImageImageView.setAnchors(leading: leadingAnchor, widthConstant: 45, heightConstant: 45)
        albumImageImageView.setCenterAnchor(centerY: centerYAnchor)
        emptyAlbumImageView.setSizeAnchor(size: .init(width: 25, height: 25))
        emptyAlbumImageView.setCenterAnchor(centerX: albumImageImageView.centerXAnchor, centerY: albumImageImageView.centerYAnchor)
        nextButton.setAnchors(trailing: trailingAnchor, widthConstant: 45, heightConstant: 45)
        nextButton.setCenterAnchor(centerY: centerYAnchor)
        playPauseButton.setAnchors(trailing: nextButton.leadingAnchor, trailingPadding: 5, widthConstant: 45, heightConstant: 45)
        playPauseButton.setCenterAnchor(centerY: centerYAnchor)
        containerView.setAnchors(leading: albumImageImageView.trailingAnchor, leadingPadding: 15, trailing: playPauseButton.leadingAnchor, trailingPadding: 15, heightConstant: 45)
        containerView.addSubviews(songNameLabel, artistNameLabel)
        songNameLabel.setAnchors(top: containerView.topAnchor, topPadding: 2, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, heightConstant: 20)
        artistNameLabel.setAnchors(bottom: containerView.bottomAnchor, bottomPadding: 2, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, heightConstant: 20)
    }
}
