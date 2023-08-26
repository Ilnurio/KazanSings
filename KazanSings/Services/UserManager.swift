//
//  UserManager.swift
//  KazanSings
//
//  Created by M I C H A E L on 26.08.2023.
//

import Foundation

final class UserManager {
    private enum Keys: String {
        case index
    }
    
    static var userBitRateIndex: Int! {
        get {
            return UserDefaults.standard.integer(forKey: Keys.index.rawValue)
        } set {
            let defaults = UserDefaults.standard
            if let index = newValue {
                defaults.set(index, forKey: Keys.index.rawValue)
                print("VALUE: \(index) WAS ADDED TO KEY \(Keys.index.rawValue)")
            } else {
                defaults.removeObject(forKey: Keys.index.rawValue)
            }
        }
    }
}
