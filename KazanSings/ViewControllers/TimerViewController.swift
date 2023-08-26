//
//  TimerViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 04.06.2023.
//

import UIKit
import Combine

final class TimerViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var timerPicker: UIDatePicker!
    @IBOutlet private var startButton: UIButton!
    
    // MARK: - Private Properties
    private let timerManager = TimerManager.shared
    private var cancelables: Set<AnyCancellable> = []
    private var timer: Timer? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTimer()
        timerPicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    override func viewWillLayoutSubviews() {
        startButton.layer.cornerRadius = startButton.frame.height / 2
        backButton.layer.cornerRadius = backButton.frame.height / 2
    }
    
    // MARK: - IB Actions
    @IBAction private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction private func startButtonPressed() {
        if timer == nil {
            timerManager.start(picker: timerPicker.countDownDuration)
        } else {
            timerManager.stop()
        }
        updateViews()
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        if timer != nil {
            startButton.setTitle("Завершить", for: .normal)
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.timerPicker.alpha = 0
                self?.timeLabel.alpha = 1
                self?.startButton.backgroundColor = UIColor(named: "TimerRed")
            }
        } else {
            startButton.setTitle("Старт", for: .normal)
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.timerPicker.alpha = 1
                self?.timeLabel.alpha = 0
                self?.startButton.backgroundColor = UIColor(named: "MainColor")
            }
        }
    }
}

// MARK: - Extension for Binding
extension TimerViewController {
    private func bindTimer() {
        timerManager.$timeString
            .sink { [weak self] newText in
                self?.timeLabel.text = newText
            }
            .store(in: &cancelables)
        
        timerManager.$timer
            .sink { [weak self] timer in
                self?.timer = timer
            }
            .store(in: &cancelables)
    }
}
