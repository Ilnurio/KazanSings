//
//  InfoList.swift
//  KazanSings
//
//  Created by M I C H A E L on 31.05.2023.
//

import Foundation

struct InfoList {
    let header: String
    let titles: [String]
    let imageNames: [String]
    
    var segueIDs: [String?]?
    var links: [String]?
    var descriptions: [String]?
    var otherImages: [String]?
}

extension InfoList {
    static func getInfoList() -> [InfoList] {
        
        var appVersion = "Не удалось получить версию приложения"
        
        let version = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        )
        
        if let version = version as? String {
            appVersion = "Version: \(version)"
        }
        
        return [
            InfoList(
                header: "Контакты",
                titles: ["Перейти на сайт",
                         "Написать на почту",
                         "Группа в VK",
                         "Группа в Telegram",
                         "Группа в WhatsApp"],
                imageNames: ["myLink",
                             "myMail",
                             "vk",
                             "telegram",
                             "whatsApp"],
                links: ["https://www.kazansings.ru",
                        "on-line-misha@mail.ru",
                        "https://vk.me/join/AJQ1dxSPjSPs_1X5AHsBqPnf",
                        "https://t.me/kazanpoet",
                        "https://chat.whatsapp.com/DcYXYr39xVLEbu9wGQtB5u"]
            ),
            InfoList(
                header: "О нас",
                titles: ["Про «Казань Поёт»",
                         "Команда"],
                imageNames: ["info.circle.fill",
                             "person.circle.fill"],
                segueIDs: ["showAboutUs",
                           "showCompany"]
            ),
            InfoList(
                header: "О приложении",
                titles: ["Оценить в AppStore",
                         "Политика конфиденциальности",
                         "Правила и условия"],
                imageNames: ["star.fill",
                             "list.dash.header.rectangle",
                             "list.bullet.rectangle.fill"],
                segueIDs: [nil,
                           "showPolicy",
                           "showRules"]
            ),
            InfoList(
                header: "",
                titles: [appVersion],
                imageNames: [""]
            )
        ]
    }
}
