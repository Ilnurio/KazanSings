//
//  TimerViewController.swift
//  KazanSings
//
//  Created by M I C H A E L on 04.06.2023.
//

import UIKit

final class TimerViewController: UIViewController {
    
    private var timer: Timer?
    private var remainingTime: TimeInterval = 0 {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss"
            let formattedTime = formatter.string(
                from: Date(timeIntervalSince1970: remainingTime)
            )
            timeLabel.text = formattedTime
            print(formattedTime) // Убрать
        }
    }
    
    let timerData = TimerData.shared
    @IBOutlet var MYLABEL: UILabel!
    
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var timerPicker: UIDatePicker!
    @IBOutlet private var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerPicker.setValue(UIColor.white, forKeyPath: "textColor")
        timeLabel.alpha = 0
    }
    
    override func viewWillLayoutSubviews() {
        startButton.layer.cornerRadius = startButton.frame.height / 2
        backButton.layer.cornerRadius = backButton.frame.height / 2
    }
    
    @IBAction private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction private func startButtonPressed() {
        if timer == nil {
            startTimer()
        } else {
            stopTimer()
        }
        updateViews()
    }
    
    private func startTimer() {
        remainingTime = timerPicker.countDownDuration
        DispatchQueue.global().sync { [weak self] in
            self?.timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self as Any,
                selector: #selector(self?.updateTimer),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateViews() {
        if timer != nil {
            startButton.setTitle("Завершить", for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.timerPicker.alpha = 0
                self.timeLabel.alpha = 1
                self.startButton.backgroundColor = UIColor(named: "TimerRed")
            }
        } else {
            startButton.setTitle("Старт", for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.timerPicker.alpha = 1
                self.timeLabel.alpha = 0
                self.startButton.backgroundColor = UIColor(named: "MainColor")
            }
        }
    }
    
    @objc private func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            stopTimer()
        }
    }
}
