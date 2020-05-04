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
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        v.layer.borderColor = UIColor.systemBlue.cgColor
        v.layer.borderWidth = 1
        v.image = UIImage(systemName: "music.note")
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        return v
    }()
    
    lazy var songNameLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
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
        let v = UIButton()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.systemBlue.cgColor
        v.layer.cornerRadius = 15
        v.setImage(UIImage(systemName: "play.fill"), for: .normal)
        v.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        return v
    }()
    
    lazy var nextButton : UIButton = {
        let v = UIButton()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.systemBlue.cgColor
        v.layer.cornerRadius = 15
        v.setImage(UIImage(systemName: "forward.fill"), for: .normal)
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
        addSubview(albumImageImageView)
        albumImageImageView.setAnchors(leading: leadingAnchor, width: 45, height: 45)
        albumImageImageView.setCenterAnchor(centerY: centerYAnchor)
        addSubview(nextButton)
        nextButton.setAnchors(trailing: trailingAnchor, width: 45, height: 45)
        nextButton.setCenterAnchor(centerY: centerYAnchor)
        addSubview(playPauseButton)
        playPauseButton.setAnchors(trailing: nextButton.leadingAnchor, trailingPadding: 5, width: 45, height: 45)
        playPauseButton.setCenterAnchor(centerY: centerYAnchor)
        let containerView = UIView()
        addSubview(containerView)
        containerView.setAnchors(leading: albumImageImageView.trailingAnchor, leadingPadding: 5, trailing: playPauseButton.leadingAnchor, trailingPadding: 5, height: 45)
        containerView.addSubview(songNameLabel)
        songNameLabel.setAnchors(top: containerView.topAnchor, topPadding: 2, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, height: 20)
        containerView.addSubview(artistNameLabel)
        artistNameLabel.setAnchors(bottom: containerView.bottomAnchor, bottomPadding: 2, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, height: 20)
    }
}
