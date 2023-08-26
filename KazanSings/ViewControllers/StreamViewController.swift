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
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var timerButton: UIButton!
    @IBOutlet private var bitRateButton: UIButton!
    
    private let bitRateManager = BitRateManager.shared
    
    private let timerManager = TimerManager.shared
    private var cancelables: Set<AnyCancellable> = []
    private var remainingTime: TimeInterval = 0
    
    private let audioManager = AudioManager.shared
    
    private var timer: Timer? {
        didSet {
            if timer == nil && remainingTime == 0 {
                audioManager.pausePlayer(playButton)
                timerButton.tintColor = .white
                timerButton.isEnabled = false
            } else if timer == nil {
                timerButton.tintColor = .white
            } else {
                timerButton.tintColor = .orange
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseManager.shared.fetchLinks {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.playButton.isHidden = false
                self.bitRateButton.isHidden = false
                self.timerButton.isHidden = false
                self.audioManager.setupRadio(self.playButton, self.timerButton)
                self.bindTimer()
            }
        }
    }
    
    @IBAction private func playButtonPressed() {
        audioManager.refresh(playButton, timerButton)
        print(bitRateManager.currentLink!)
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
        let items: [Any] = [image, shareInfo.title, shareInfo.link]
        
        let shareSheet = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        
        shareSheet.excludedActivityTypes = [.saveToCameraRoll, .print]
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
