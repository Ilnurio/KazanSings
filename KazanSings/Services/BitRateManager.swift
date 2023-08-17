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

struct BitRateURL {
    static var urls: [String: URL] = [
        "url_64": URL(string: "https://stream01.hitv.ru:8443/kazansings-64kb")!,
        "url_128": URL(string: "https://stream01.hitv.ru:8443/kazansings-128kb")!,
        "url_192": URL(string: "https://stream01.hitv.ru:8443/kazansings-192kb")!,
        "url_320": URL(string: "https://stream01.hitv.ru:8443/kazansings-320kb")!
    ]
}

enum BitRateURLRC: String {
    case URL_64
    case URL_128
    case URL_192
    case URL_320
}

final class BitRateManager: ObservableObject {
    static let shared = BitRateManager()
    let bitRate = BitRate.getBitRate()
    
    var currentLink = BitRateURL.urls["url_64"]!
    
    private init() {}
    
    func setupRemoteConfigDefaults() {
        
        let defaultValues: [String: Any?] = [
            BitRateURLRC.URL_64.rawValue: BitRateURL.urls["url_64"],
            BitRateURLRC.URL_128.rawValue: BitRateURL.urls["url_128"],
            BitRateURLRC.URL_192.rawValue: BitRateURL.urls["url_192"],
            BitRateURLRC.URL_320.rawValue: BitRateURL.urls["url_320"]
        ]
        
        RemoteConfig.remoteConfig().setDefaults(defaultValues as? [String: NSObject])
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        RemoteConfig.remoteConfig().configSettings = settings
    }
    
    func fetchRemoteConfig() {
        
        RemoteConfig.remoteConfig().fetch {
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
        
        BitRateURL.urls["url_64"] = URL(string: url_64)!
        BitRateURL.urls["url_128"] = URL(string: url_128)!
        BitRateURL.urls["url_192"] = URL(string: url_192)!
        BitRateURL.urls["url_320"] = URL(string: url_320)!
    }
    
    func string(forKey key: String) -> String {
        RemoteConfig.remoteConfig().configValue(forKey: key).stringValue ?? "https://stream01.hitv.ru:8443/kazansings-64kb"
    }
}
