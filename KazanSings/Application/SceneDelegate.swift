//
//  SceneDelegate.swift
//  KazanSings
//
//  Created by Ilnur on 31.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let _ = (scene as? UIWindowScene) else { return }

        window?.overrideUserInterfaceStyle = .light
    }
}
