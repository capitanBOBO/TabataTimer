//
//  MainScreenView.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

protocol MainScreenViewDelegate : class {
    func playPauseButtonAction()
    func nextSongButtonAction()
    func startTimerButtonAction()
    func pauseTimerButtonAction()
    func stopTimerButtonAction()
    func editTimerButtonAction()
}

class MainScreenView : UIView {
    
    enum PlayButtonState {
        case playing
        case paused
    }
    
    weak var delegate: MainScreenViewDelegate?
    
    lazy var musicControlView : MusicControlView = MusicControlView()
    
    lazy var progressView : CircleProgressView = CircleProgressView()
    
    lazy var bottomControlPanelView : BottomControlPanelView = BottomControlPanelView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        addSubviews(musicControlView, progressView, bottomControlPanelView)
        musicControlView.setAnchors(top: safeAreaLayoutGuide.topAnchor, topPadding: 20, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20, heightConstant: 45)
        musicControlView.playPauseButton.addTarget(self, action: #selector(playPauseButtonAction), for: .touchUpInside)
        musicControlView.nextButton.addTarget(self, action: #selector(nextSongButtonAction), for: .touchUpInside)
        
        progressView.setAnchors(leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20, heightAnchor: progressView.widthAnchor)
        progressView.setCenterAnchor(centerX: centerXAnchor, centerY: centerYAnchor)
        
        bottomControlPanelView.setAnchors(bottom: safeAreaLayoutGuide.bottomAnchor, bottomPadding: 20, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20)
        bottomControlPanelView.startTimerButton.addTarget(self, action: #selector(startTimerButtonAction), for: .touchUpInside)
        bottomControlPanelView.editTimerButton.addTarget(self, action: #selector(editTimerButtonAction), for: .touchUpInside)
        bottomControlPanelView.stopTimerButton.addTarget(self, action: #selector(stopTimerButtonAction), for: .touchUpInside)
        bottomControlPanelView.pauseTimerButton.addTarget(self, action: #selector(pauseTimerButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: Interface

extension MainScreenView {
    
    func prepareMusicControlPanel(songName: String, artistName: String? = nil, albumImage: UIImage? = nil) {
        musicControlView.songNameLabel.text = songName
        musicControlView.artistNameLabel.text = artistName
        musicControlView.albumImageImageView.image = albumImage
        musicControlView.albumImageImageView.layer.borderWidth = albumImage == nil ? 2 : 0
    }

    func setPlaybackState(_ state: PlayButtonState) {
        musicControlView.playPauseButton.isSelected = state == .playing
    }
    
}

//MARK: Actions

extension MainScreenView {
    @objc func playPauseButtonAction() {
        delegate?.playPauseButtonAction()
    }
    
    @objc func nextSongButtonAction() {
        delegate?.nextSongButtonAction()
    }
    
    @objc func startTimerButtonAction() {
        delegate?.startTimerButtonAction()
        bottomControlPanelView.toggleState()
    }
    
    @objc func editTimerButtonAction() {
        delegate?.editTimerButtonAction()
    }
    
    @objc func stopTimerButtonAction() {
        delegate?.stopTimerButtonAction()
        bottomControlPanelView.toggleState()
    }
    
    @objc func pauseTimerButtonAction() {
        delegate?.pauseTimerButtonAction()
    }
}
