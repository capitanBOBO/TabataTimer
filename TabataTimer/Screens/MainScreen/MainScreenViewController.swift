//
//  MainScreenViewController.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    private let musicPlayerManager = MusicPlayerManager()
    private var sec: CGFloat = 0

    lazy var thisView : MainScreenView = {
        let v = MainScreenView()
        v.delegate = self
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(thisView)
        thisView.fillInSuperview()
        musicPlayerManager.delegate = self
        musicPlayerManager.authorize()
    }
    
    func prepareMusicControl(from item: MusicPlayerManager.MusicPlayerItem) {
        thisView.prepareMusicControlPanel(songName: item.songName, artistName: item.artistName, albumImage: item.albumImage)
    }
    
}

//MARK: MainScreenView Delegate

extension MainScreenViewController : MainScreenViewDelegate {
    func startTimerButtonAction() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            DispatchQueue.main.async {
                if self.sec <= 60 {
                    self.sec += 1
                    self.thisView.progressView.progress = self.sec/60
                } else {
                    self.thisView.progressView.progress = 0
                    timer.invalidate()
                }
            }
        }
    }
    
    func pauseTimerButtonAction() {
        
    }
    
    func stopTimerButtonAction() {
        
    }
    
    func editTimerButtonAction() {
        present(SettingsScreenViewController(), animated: true, completion: nil)
    }
    
    func playPauseButtonAction() {
        musicPlayerManager.playStateToggle()
    }
    
    func nextSongButtonAction() {
        musicPlayerManager.nextSong()
    }
    
}

//MARK: MusicPlayerManager Delegate

extension MainScreenViewController : MusicPlayerManagerDelegate {
    func manager(_ manager: MusicPlayerManager, playingItemDidChanged item: MusicPlayerManager.MusicPlayerItem) {
        prepareMusicControl(from: item)
    }
    
    func manager(_ manager: MusicPlayerManager, playbackStateWasChanged state: MusicPlayerManager.MusicPlayerState) {
        switch state {
        case .playing:
            thisView.setPlaybackState(.playing)
        default:
            thisView.setPlaybackState(.paused)
        }
    }
    
    func manager(_ manager: MusicPlayerManager, successAuthorization: Bool) {
        if successAuthorization {
            guard let item = manager.currentItem else { return }
            prepareMusicControl(from: item)
        } else {
            thisView.musicControlView.isHidden = true
        }
    }
}

