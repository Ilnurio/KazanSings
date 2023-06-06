//
//  BitRateManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

import Foundation

enum BitRateURL {
    case bad
    case middle
    case good
    case great
    
    var url: URL {
        switch self {
        case .bad:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-64kb")!
        case .middle:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-128kb")!
        case .good:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-192kb")!
        case .great:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-320kb")!
        }
    }
}

final class BitRateManager: ObservableObject {
    static let shared = BitRateManager()
    
    var currentLink = BitRateURL.bad
    
    private init() {}
}
