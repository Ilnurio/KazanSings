//
//  StreamViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 01.06.2023.
//

import UIKit
import MediaPlayer

final class StreamViewController: UIViewController {
    
    @IBOutlet private var playButton: UIButton!
    
    private let commandCenter = MPRemoteCommandCenter.shared()
    private var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(url: URL(string: "https://stream01.hitv.ru:8443/kazansings-320kb")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            //try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ошибка настройки аудиосессии: \(error.localizedDescription)")
        }
        
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.player.play()
            self?.playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
            return .success
        }
        
        // Добавляем обработчик для команды паузы
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.player.pause()
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
    
    @IBAction private func playButtonPressed() {
        if player.timeControlStatus == .playing {
            try! AVAudioSession.sharedInstance().setActive(false)
            player.pause()
            playButton.setImage(UIImage(named: "playbutton"), for: .normal)
        } else {
            try! AVAudioSession.sharedInstance().setActive(true)
            player.play()
            playButton.setImage(UIImage(named: "pausebutton"), for: .normal)
        }
        
//        updateNowPlayingInfo()
    }
        

}

 // MARK: - ShareSheet
//extension StreamViewController {
//    func presentShareSheet() {
//        let image = UIImage(named: "logosheet.jpg")!
//        let text = textforShare
//        let shareSheet = UIActivityViewController(activityItems: [image, text], applicationActivities: nil)
//        shareSheet.popoverPresentationController?.sourceView = self.view
//        present(shareSheet, animated: true, completion: nil)
//    }
//}
