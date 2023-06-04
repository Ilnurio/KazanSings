//
//  Mail Ext + InfoTableVC.swift
//  KazanSings
//
//  Created by M I C H A E L on 04.06.2023.
//

import UIKit
import MessageUI
import AudioToolbox

// MARK: - MFMailComposeViewControllerDelegate
extension InfoTableViewController: MFMailComposeViewControllerDelegate {
    func sendMail(mail: [String], subject: String) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(mail)
            mailComposer.setSubject(subject)
            
            present(mailComposer, animated: true, completion: nil)
        } else {
            disappearableAlert(
                title: "Ошибка",
                message: "У Вас не установлен почтовый ящик"
            )
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true)
        
        switch result {
        case .cancelled:
            disappearableAlert(
                title: "Отменено",
                message: "Сообщение удалено и не было отправлено"
            )
        case .saved:
            disappearableAlert(
                title: "Отложено",
                message: "Сообщение сохранено в архиве"
            )
        case .sent:
            disappearableAlert(
                title: "Успешно",
                message: "Сообщение отправлено"
            )
            AudioServicesPlaySystemSound(1001)
        default:
            disappearableAlert(
                title: "Ошибка",
                message: "Email failed to send with error: \(error?.localizedDescription ?? "Unknown error")"
            )
        }
    }
}
