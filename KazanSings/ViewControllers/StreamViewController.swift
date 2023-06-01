//
//  StreamViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 01.06.2023.
//

import UIKit

final class StreamViewController: UIViewController {
    
    var playSing = false
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var infoButton: UIButton!
    @IBOutlet var timerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Казань Поёт"
        playButton.setImage(UIImage(named: "playbutton.png"), for: .normal)
        infoButton.setImage(UIImage(named: "infobutton"), for: .normal)
        timerButton.setImage(UIImage(named: "timerbutton"), for: .normal)
    }
    
    @IBAction func playButtonTapped() {
        // это чисто побаловаться, там потом нужно будет в mediaplayer менять кнопки
        if !playSing {
            playButton.setImage(UIImage(named: "pausebutton.png"), for: .normal)
            playSing = true
        } else {
            playButton.setImage(UIImage(named: "playbutton.png"), for: .normal)
            playSing = false
        }
    }
    
    @IBAction func timerButtonTapped() {
        
    }
    
    @IBAction func infoButtonTapped() {
        
    }
    
    
}
