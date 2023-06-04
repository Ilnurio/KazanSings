//
//  Ext + Alert.swift
//  KazanSings
//
//  Created by M I C H A E L on 04.06.2023.
//

import UIKit

// MARK: - Alert Extension
extension UIViewController {
    func showOkDenyAlert(title: String, message: String, handler: @escaping () -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            handler()
        }
        let denyAction = UIAlertAction(title: "Нет", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(denyAction)
        present(alert, animated: true)
    }
    
    func disappearableAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        present(alert, animated: true) {
            sleep(2)
            self.dismiss(animated: true)
        }
        
    }
    
    func showOkAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Да", style: .default, handler: handler)
        let denyAction = UIAlertAction(title: "Нет", style: .destructive)
      
        alert.addAction(okAction)
        alert.addAction(denyAction)
        present(alert, animated: true)
    }
    
}
