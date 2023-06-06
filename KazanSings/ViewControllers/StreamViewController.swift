//
//  StreamViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 01.06.2023.
//

import UIKit
import MediaPlayer
import Combine

final class StreamViewController: UIViewController {
    
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var timerButton: UIButton!
    
    private let bitRateManager = BitRateManager.shared
    
    private let commandCenter = MPRemoteCommandCenter.shared()
    private var player: AVPlayer!
    
    private let timerManager = TimerManager.shared
    private var cancelables: Set<AnyCancellable> = []
    private var remainingTime: TimeInterval = 0
    
    private var timer: Timer? {
        didSet {
            if timer == nil && remainingTime == 0 {
                pausePlayer()
                timerButton.tintColor = .white
            } else if timer == nil {
                timerButton.tintColor = .white
            } else {
                timerButton.tintColor = .cyan
            }
        }
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "status" {
//            switch player.status {
//            case .readyToPlay:
//
//                print(" Player is ready to play. You might want to start playing here")
//                break
//            case .failed:
//                print("Player has failed with error: \(String(describing: player.error))")
//                break
//            case .unknown:
//                print("Player has failed with error: \(String(describing: player.error))")
//                break
//            @unknown default:
//                print("Player has failed with error: \(String(describing: player.error))")
//                fatalError()
//            }
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(url: bitRateManager.currentLink.url)
//        player.currentItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        bindTimer()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ошибка настройки аудиосессии: \(error.localizedDescription)")
        }
//
        

        

        
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.player.play()
            self?.playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
            return .success
        }
        
        // Добавляем обработчик для команды паузы
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.player.pause()
            self?.timerManager.stop()
            self?.timerButton.isEnabled = false
            self?.playButton.setImage(UIImage(named: "playbutton"), for: .normal)
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
    
    private func pausePlayer() {
//        try! AVAudioSession.sharedInstance().setActive(false)
        player.pause()
        playButton.setImage(UIImage(named: "playbutton"), for: .normal)
    }
    
    @IBAction private func playButtonPressed() {
        if player.timeControlStatus == .playing {
            pausePlayer()
            timerButton.isEnabled = false
            timerManager.stop()
        } else {
            player = AVPlayer(url: bitRateManager.currentLink.url)
            try! AVAudioSession.sharedInstance().setActive(true)
            player.play()
            playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
            timerButton.isEnabled = true
        }
        
//        updateNowPlayingInfo()
    }
    
    
    @IBAction func shareSheetTapped(_ sender: UIBarButtonItem) {
        presentShareSheet()
    }
    

}

 // MARK: - ShareSheet
extension StreamViewController {
    func presentShareSheet() {
        let shareInfo = ShareSheet.getShareSheet()
        let image = UIImage(named: shareInfo.image) ?? UIImage()
        let items: [Any] = [shareInfo.title, image]
        
        let shareSheet = UIActivityViewController(activityItems: items, applicationActivities: nil)
        shareSheet.popoverPresentationController?.sourceView = self.view
        present(shareSheet, animated: true, completion: nil)
    }
}

// MARK: - Extension for Binding
extension StreamViewController {
    private func bindTimer() {
        timerManager.$timer
            .sink { [weak self] timer in
                self?.timer = timer
            }
            .store(in: &cancelables)
        
        timerManager.$remainingTime
            .sink { [weak self] time in
                self?.remainingTime = time
            }
            .store(in: &cancelables)
    }
}
