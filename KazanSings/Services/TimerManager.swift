//
//  TimerManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 05.06.2023.
//

import Foundation

final class TimerManager: ObservableObject {
    
    // MARK: - Public Properties
    static let shared = TimerManager()
    
    @Published var timer: Timer?
    @Published var timeString = ""
    @Published var remainingTime: TimeInterval = 0 {
        didSet {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            if let formattedTime = formatter.string(from: remainingTime) {
                timeString = formattedTime
            }
        }
    }
    
    // MARK: - Initializers
    private init() {}
    
    // MARK: - Public Methods
    func start(picker: TimeInterval) {
        remainingTime = picker
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true
            )
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Private Methods
    @objc private func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            stop()
        }
        //print(remainingTime)
    }
}
