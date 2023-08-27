//
//  FirebaseManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 26.08.2023.
//

import Foundation
import Firebase

enum Links: String {
    case url_64
    case url_128
    case url_192
    case url_320
    case app_link
}

final class FirebaseManager {
    static let shared = FirebaseManager()
    var urlDict: [Int: URL?] = [:]
    var appLinkString: String = ""
    
    private let bitRate = BitRate.getBitRate()
    
    private init() {}
    
    func fetchLinks(completion: @escaping () -> ()) {
        let remoteConfig = RemoteConfig.remoteConfig()
        let keys: [Int: Links] = [0: .url_64, 1: .url_128, 2: .url_192, 3: .url_320]
  
        remoteConfig.fetch(withExpirationDuration: 3600) { [weak self] (status, error) in
            if status == .success {
                remoteConfig.activate { [weak self] _, error in
                    if error == nil {
                        for (key, link) in keys {
                            guard let urlFromRemoteConfig = remoteConfig.configValue(forKey: link.rawValue).stringValue
                            else { return }
                            if let url = URL(string: urlFromRemoteConfig) {
                                self?.urlDict[key] = url
                            }
                        }
                        
                        guard let appLinkFromRemoteConfig = remoteConfig.configValue(forKey: Links.app_link.rawValue).stringValue else { return }
                        self?.appLinkString = appLinkFromRemoteConfig
                        
                        if let curUrl = self?.urlDict[UserManager.userBitRateIndex] {
                            BitRateManager.shared.currentLink = curUrl
                        } else {
                            BitRateManager.shared.currentLink = self?.bitRate[UserManager.userBitRateIndex].link
                        }
                        completion()
                    }
                }
            } else {
                print("Error fetching remote config: \(error?.localizedDescription ?? "No error")")
            }
        }
    }
}
