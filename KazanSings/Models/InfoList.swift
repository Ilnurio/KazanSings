//
//  InfoList.swift
//  KazanSings
//
//  Created by M I C H A E L on 31.05.2023.
//

import Foundation

//                    """
//                    «Казань поёт» – онлайн-радио, где круглосуточно звучит музыка артистов, которые считают своей родиной город Казань или всю солнечную Татарию. Челны, Альметьевск, Актаныш, Буинск, все остальные города республики и конечно, столица Казань - все самые крутые музыканты представляют свои лучшие песни на онлайн-радио Казань поёт. Здесь играют хиты тех артистов, которые живут по соседству, и на концерты которых вы можете попасть в любой момент. Музыкантам и слушателям больше не надо искать друг друга - все мы встречаемся на онлайн-радио «Казань поёт». Слушайте наших! Поддержите наших! Делитесь информацией о нас со всеми, кого вы знаете! Чем больше нас, тем ярче наши звезды!
//                    """



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
                             "list.bullet.rectangle.fill",
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


