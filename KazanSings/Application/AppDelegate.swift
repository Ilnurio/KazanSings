//
//  AppDelegate.swift
//  KazanSings
//
//  Created by Ilnur on 31.05.2023.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
//        DispatchQueue.main.async {
//            FirebaseManager.shared.fetchLinks()
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

//class ABCD {
//
//    static let shared = ABCD()
//    func abc() {
//        let remoteConfig = RemoteConfig.remoteConfig()
//        let keys = ["url_64", "url_128", "url_192", "url_320"]
//        var urlArray: [URL] = []
//        // Set default values
//        let defaultValues: [String: NSObject] = ["my_url": "https://defaulturl.com" as NSObject]
//        remoteConfig.setDefaults(defaultValues)
//
//        // Fetch the remote values
//        remoteConfig.fetch(withExpirationDuration: 3600) { (status, error) in
//            if status == .success {
//                remoteConfig.activate(completion: { (bool, error)  in
//                    if error == nil {
//                        for key in keys {
//                            guard let urlFromRemoteConfig = remoteConfig.configValue(forKey: key).stringValue
//                            else { return }
//                                urlArray.append(URL(string: urlFromRemoteConfig)!)
//                            print("Fetched URL: \(urlFromRemoteConfig )")
//
//                        }
//                        print(urlArray)
//                        BitRateManager.shared.currentLink = urlArray.first!
//                    }
//                })
//            } else {
//                print("Error fetching remote config: \(error?.localizedDescription ?? "No error")")
//            }
//        }
//
//
//
//
//    }
//
//    func abcd() {
//        func fetchRemoteConfigValues() {
//            let remoteConfig = RemoteConfig.remoteConfig()
//
//            // Set default values
//            let defaultValues: [String: NSObject] = [
//                "url_128": "https://defaulturl.com" as NSObject,
//                "url_129": "https://defaulturl.com" as NSObject,
//                "url_130": "https://defaulturl.com" as NSObject,
//                "url_131": "https://defaulturl.com" as NSObject
//            ]
//            remoteConfig.setDefaults(defaultValues)
//
//            // Fetch the remote values
//            remoteConfig.fetch(withExpirationDuration: 3600) { (status, error) in
//                if status == .success {
//                    remoteConfig.activate(completion: { (bool, error) in
//                        if error == nil {
//                            let keys = ["url_128", "url_192", "url_320", "url_64"]
//                            for key in keys {
//                                if let urlFromRemoteConfig = remoteConfig.configValue(forKey: key).stringValue {
//                                    print("Fetched URL for \(key): \(urlFromRemoteConfig)")
//                                } else {
//                                    print("\(key) is not available")
//                                }
//                            }
//                        } else {
//                            print("Error activating fetched config values: \(error?.localizedDescription ?? "Unknown error")")
//                        }
//                    })
//                } else {
//                    print("Error fetching remote config: \(error?.localizedDescription ?? "No error")")
//                }
//            }
//        }
//    }
//}
