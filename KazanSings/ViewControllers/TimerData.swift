//
//  TimerData.swift
//  KazanSings
//
//  Created by M I C H A E L on 05.06.2023.
//

import Foundation

final class TimerData {
    static let shared = TimerData()
    
    var timerTime = "Пусто"
    
    private init() {}
}
