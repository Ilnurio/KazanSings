//
//  InfoList.swift
//  KazanSings
//
//  Created by M I C H A E L on 31.05.2023.
//


//let textforShare =
//"""
//Слушайте первое музыкальное онлайн-радио в Татарстане.
//Здесь звучат песни, которые больше нигде не звучат.
//"""

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
        [
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
                             "whatsApp"]
            ),
            InfoList(
                header: "О приложении",
                titles: ["Оценить в AppStore",
                         "Политика конфиденциальности",
                         "Правила и условия"],
                imageNames: ["star.fill",
                             "list.clipboard",
                             "list.bullet.rectangle.fill"],
                segueIDs: [nil,
                           "showPolicy",
                           "showRules"]
            )
        ]
        
        
        
        
        
        
        
        
//        [
//            InfoList(
//                header: "Контакты",
//                title: "Контакты",
//                imageName: "person.circle.fill",
//                segueID: "showContact"
//            ),
//            InfoList(
//                title: "О нас",
//                imageName: "info.bubble.fill",
//                segueID: "showAboutUs"
//            ),
//            InfoList(
//                title: "Политика конфиденциальности",
//                imageName: "list.clipboard",
//                segueID: "showPolicy"
//            ),
//            InfoList(
//                title: "Правила",
//                imageName: "list.bullet.rectangle.fill",
//                segueID: "showRules"
//            )
//        ]
    }
}


