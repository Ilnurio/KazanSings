//
//  BitRateManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseRemoteConfig

//enum BitRateURL {
//    case bad
//    case middle
//    case good
//    case great
//
//    var url: URL {
//        switch self {
//        case .bad:
//            return URL(string: "https://stream01.hitv.ru:8443/kazansings-64kb")!
//        case .middle:
//            return URL(string: "https://stream01.hitv.ru:8443/kazansings-128kb")!
//        case .good:
//            return URL(string: "https://stream01.hitv.ru:8443/kazansings-192kb")!
//        case .great:
//            return URL(string: "https://stream01.hitv.ru:8443/kazansings-320kb")!
//        }
//    }
//}

enum BitRateURL: String {
    case url_64
    case url_128
    case url_192
    case url_320
}

final class BitRateManager: ObservableObject {
    static let shared = BitRateManager()
    
    var currentLink = BitRateURL.url_64
    
    private init() {
        setupRemoteConfigDefaults()
    }
    
    func setupRemoteConfigDefaults() {
        
        let defaultValues: [String: Any?] = [
            BitRateURL.url_64.rawValue: "https://stream01.hitv.ru:8443/kazansings-64kb",
            BitRateURL.url_128.rawValue: "https://stream01.hitv.ru:8443/kazansings-128kb",
            BitRateURL.url_192.rawValue: "https://stream01.hitv.ru:8443/kazansings-192kb",
            BitRateURL.url_320.rawValue: "https://stream01.hitv.ru:8443/kazansings-320kb"
        ]
        
        RemoteConfig.remoteConfig().setDefaults(defaultValues as? [String: NSObject])
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        RemoteConfig.remoteConfig().configSettings = settings
    }
    
    func fetchRemoteConfig() {
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) {
            [unowned self] (status, error) in
            guard error == nil else {
                print("something goes wrong: \(String(describing: error))")
                return
            }
            
            print("Good connection from RemoteConfig")
            RemoteConfig.remoteConfig().activate()
            self.updateBitRatesWithRC()
        }
    }
    
    func updateBitRatesWithRC() {
        let url_64 = string(forKey: BitRateURL.url_64)
        let url_128 = string(forKey: BitRateURL.url_128)
        let url_192 = string(forKey: BitRateURL.url_192)
        let url_320 = string(forKey: BitRateURL.url_320)
        // дальше данные никуда не идут
    }
    
    func string(forKey key: BitRateURL) -> String {
        RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? "https://stream01.hitv.ru:8443/kazansings-64kb"
    }
}
