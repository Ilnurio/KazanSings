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
}

final class FirebaseManager {
    static let shared = FirebaseManager()
    
    var urlDict: [Int: URL?] = [:]
    
    private init() {}
    
    func fetchLinks(completion: @escaping () -> ()) {
        let remoteConfig = RemoteConfig.remoteConfig()
        let keys: [Int: Links] = [0: .url_64, 1: .url_128, 2: .url_192, 3: .url_320]
        
        // Set default values
//        let defaultValues: [String: NSObject] = ["my_url": "https://defaulturl.com" as NSObject]
//        remoteConfig.setDefaults(defaultValues)

        // Fetch the remote values
        
        
        remoteConfig.fetch(withExpirationDuration: 3600) { (status, error) in
            if status == .success {
                remoteConfig.activate { _, error in
                    if error == nil {
                        for (key, link) in keys {
                            guard let urlFromRemoteConfig = remoteConfig.configValue(forKey: link.rawValue).stringValue
                            else { return }
                            if let url = URL(string: urlFromRemoteConfig) {
                                self.urlDict[key] = url
                            }
                            
                        }
                        print(self.urlDict)
                    
                        if let curUrl = self.urlDict[1] {
                            BitRateManager.shared.currentLink = curUrl
                        } else {
                            BitRateManager.shared.currentLink = BitRate.getBitRate().first?.link
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
