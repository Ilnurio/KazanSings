//
//  BitRateManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

import Foundation

final class BitRateManager: ObservableObject {
    static let shared = BitRateManager()
    var currentLink: URL?
    
    private let bitRate = BitRate.getBitRate()
    
    private init() {}
}
