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

enum BitRateURL: String {
    case url_64
    case url_128
    case url_192
    case url_320

    var url: URL {
        switch self {
        case .url_64:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-64kb")!
        case .url_128:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-128kb")!
        case .url_192:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-192kb")!
        case .url_320:
            return URL(string: "https://stream01.hitv.ru:8443/kazansings-320kb")!
        }
    }
}

enum BitRateURLRC: String {
    case URL_64
    case URL_128
    case URL_192
    case URL_320
}

final class BitRateManager: ObservableObject {
    static let shared = BitRateManager()
    
    var currentLink = BitRateURL.url_64
    
    private init() {}
    
    func setupRemoteConfigDefaults() {
        
        let defaultValues: [String: Any?] = [
            BitRateURLRC.URL_64.rawValue: BitRateURL.url_64,
            BitRateURLRC.URL_128.rawValue: BitRateURL.url_128,
            BitRateURLRC.URL_192.rawValue: BitRateURL.url_192,
            BitRateURLRC.URL_320.rawValue: BitRateURL.url_320
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
        let url_64 = string(forKey: "url_64")
        let url_128 = string(forKey: "url_128")
        let url_192 = string(forKey: "url_192")
        let url_320 = string(forKey: "url_320")
        
        
    }
    
    func string(forKey key: String) -> String {
        RemoteConfig.remoteConfig().configValue(forKey: key).stringValue ?? "https://stream01.hitv.ru:8443/kazansings-64kb"
    }
}
