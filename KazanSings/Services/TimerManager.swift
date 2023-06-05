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
    
    // MARK: - Private Properties
//    private var remainingTime: TimeInterval = 0 {
//        didSet {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "hh:mm:ss"
//
//            let formattedTime = formatter.string(
//                from: Date(timeIntervalSince1970: remainingTime)
//            )
//
//            timeString = formattedTime
//
////             Время окончания таймера (на будущее)
////            let formattedTime = formatter.string(
////                from: Date().advanced(by: remainingTime)
////            )
//        }
//    }
    
//    private var remainingTime: TimeInterval = 0 {
//        didSet {
//            timeString = timeStringFromTimeInterval(remainingTime)
//        }
//    }
//
//    private func timeStringFromTimeInterval(_ interval: TimeInterval) -> String {
//        let totalSeconds = Int(interval)
//
//        let hours = totalSeconds / 3600
//        let minutes = (totalSeconds % 3600) / 60
//        let seconds = totalSeconds % 60
//
//        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
//    }
    
    private var remainingTime: TimeInterval = 0 {
        didSet {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
//            formatter.zeroFormattingBehavior = .pad
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
    }
}
