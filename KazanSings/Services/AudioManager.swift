//
//  AudioManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 25.08.2023.
//

import Foundation
import AVFoundation
import MediaPlayer

final class AudioManager {
    static let shared = AudioManager()
    var player: AVPlayer!
    
    private let timerManager = TimerManager.shared
    private let bitRateManager = BitRateManager.shared
    private let commandCenter = MPRemoteCommandCenter.shared()
    
    private init() {}
    
    func setupRadio(_ playButton: UIButton?, _ timerButton: UIButton?) {
        if let url = bitRateManager.currentLink {
            player = AVPlayer(url: url)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        } catch {
            print("Ошибка настройки аудиосессии: \(error.localizedDescription)")
        }
        
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.player = AVPlayer(url: (self?.bitRateManager.currentLink)!)
            try! AVAudioSession.sharedInstance().setActive(true)
            self?.player.play()
            if let timerButton = timerButton, let playButton = playButton {
                timerButton.isEnabled = true
                playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
            }
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.player.pause()
            self?.timerManager.stop()
            if let timerButton = timerButton, let playButton = playButton {
                timerButton.isEnabled = false
                playButton.setImage(UIImage(named: "playbutton"), for: .normal)
            }
            return .success
        }
        
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Казань Поёт"
        nowPlayingInfo[MPMediaItemPropertyArtist] = "Радио - Прямой эфир"
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        
        if let artworkImage = UIImage(named: "AppIcon") {
            let artwork = MPMediaItemArtwork(boundsSize: artworkImage.size) { _ in
                return artworkImage
            }
            MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPMediaItemPropertyArtwork] = artwork
        }
    }
    
    func pausePlayer(_ playButton: UIButton) {
        player.pause()
        playButton.setImage(UIImage(named: "playbutton"), for: .normal)
    }
    
    func refresh(_ playButton: UIButton, _ timerButton: UIButton) {
        if player.timeControlStatus == .playing {
            pausePlayer(playButton)
            timerButton.isEnabled = false
            timerManager.stop()
        } else {
            if let url = bitRateManager.currentLink {
                player = AVPlayer(url: url)
            }
            try? AVAudioSession.sharedInstance().setActive(true)
            player.play()
            playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
            timerButton.isEnabled = true
        }
    }
}
