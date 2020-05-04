//
//  MusicPlayerManager.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import Foundation
import MediaPlayer

protocol MusicPlayerManagerDelegate : class {
    func manager(_ manager: MusicPlayerManager, playingItemDidChanged item: MusicPlayerManager.MusicPlayerItem)
    func manager(_ manager: MusicPlayerManager, playbackStateWasChanged state: MusicPlayerManager.MusicPlayerState)
    func manager(_ manager: MusicPlayerManager, successAuthorization: Bool)
}

class MusicPlayerManager {
    
    enum MusicPlayerState {
        case playing
        case stoped
        case paused
        
        init(from state: MPMusicPlaybackState) {
            switch state {
            case .playing:
                self = .playing
            case .paused:
                self = .paused
            default:
                self = .stoped
            }
        }
    }
    
    struct MusicPlayerItem {
        let songName: String
        let artistName: String
        var albumImage: UIImage?
        
        init(from item: MPMediaItem) {
            songName = item.title ?? "Untitled"
            artistName = item.artist ?? ""
            albumImage = item.artwork?.image(at: .init(width: 45, height: 45))
        }
    }
    
    private let player = MPMusicPlayerController.systemMusicPlayer
    weak var delegate: MusicPlayerManagerDelegate?
    
    deinit {
        prepareNotifications(isInit: false)
    }
    
    func authorize() {
        switch MPMediaLibrary.authorizationStatus() {
        case .notDetermined:
            MPMediaLibrary.requestAuthorization { [weak self] (status) in
                if status == .authorized {
                    self?.prepareNotifications(isInit: true)
                }
                DispatchQueue.main.async {
                    if let weakSelf = self {
                        self?.delegate?.manager(weakSelf, successAuthorization: status == .authorized)
                    }
                }
            }
        case .authorized:
            prepareNotifications(isInit: true)
            delegate?.manager(self, successAuthorization: true)
        default:
            delegate?.manager(self, successAuthorization: false)
        }
    }
    
    func playStateToggle() {
        if !player.isPreparedToPlay {
            player.prepareToPlay()
        }
        if player.playbackState == .playing {
            player.pause()
        } else {
            player.play()
        }
    }
    
    func nextSong() {
        if !player.isPreparedToPlay {
            player.prepareToPlay()
        }
        player.skipToNextItem()
    }
    
    var currentItem : MusicPlayerItem? {
        guard let item = player.nowPlayingItem else { return nil }
        return MusicPlayerItem(from: item)
    }
}

//MARK: Private

fileprivate extension MusicPlayerManager {
    func prepareNotifications(isInit: Bool) {
        if isInit {
            player.beginGeneratingPlaybackNotifications()
            NotificationCenter.default.addObserver(self, selector: #selector(handlePlaybackStateDidChange), name: .MPMusicPlayerControllerPlaybackStateDidChange, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(handlePlayingItemDidChange), name: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
        } else {
            player.endGeneratingPlaybackNotifications()
            NotificationCenter.default.removeObserver(self, name: .MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
            NotificationCenter.default.removeObserver(self, name: .MPMusicPlayerControllerPlaybackStateDidChange, object: nil)
        }
    }
    
    
    
    @objc func handlePlaybackStateDidChange() {
        delegate?.manager(self, playbackStateWasChanged: .init(from: player.playbackState))
    }
    
    @objc func handlePlayingItemDidChange() {
        guard let nowPlayingItem = player.nowPlayingItem else { return }
        delegate?.manager(self, playingItemDidChanged: .init(from: nowPlayingItem))
    }
}
