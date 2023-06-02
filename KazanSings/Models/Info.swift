//
//  Info.swift
//  KazanSings
//
//  Created by M I C H A E L on 31.05.2023.
//


//let textforShare =
//"""
//Слушайте первое музыкальное онлайн-радио в Татарстане.
//Здесь звучат песни, которые больше нигде не звучат.
//"""



struct Info {
    let title: String
    let imageName: String
    
    var segueID: String?
    var link: String?
}

extension Info {
    static func getInfo() -> [Info] {
        [
            Info(
                title: "Контакты",
                imageName: "person.circle.fill",
                segueID: "showContact"
            ),
            Info(
                title: "О нас",
                imageName: "info.bubble.fill",
                segueID: "showAboutUs"
            ),
            Info(
                title: "Политика конфиденциальности",
                imageName: "list.clipboard",
                segueID: "showPolicy"
            ),
            Info(
                title: "Правила",
                imageName: "list.bullet.rectangle.fill",
                segueID: "showRules"
            )
        ]
    }
}














// MARK: - Информация
struct Info1 {
    let contact: Contact
    let aboutUs: AboutUs
    let policy: Policy
    let rules: Rules
}

// MARK: - Контакты
struct Contact {
    let title: String
    let imageName: String
    let segueID: String
    
//    let site: Site
//    let mail: Mail
//    let groupVK: GroupVK
    

}
//
//struct Site {
//    let title: String
//    let imageName: String
//    let link: String
//}
//
//struct Mail {
//    let title: String
//    let imageName: String
//    let link: String
//}
//
//struct GroupVK {
//    let title: String
//    let imageName: String
//    let link: String
//}



// MARK: - О нас
struct AboutUs {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}

// MARK: - Политика конфиденциальности
struct Policy {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}

// MARK: - Правила и условия пользования
struct Rules {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}









// MARK: - About Us Extension
extension Contact {
    static func getContact() -> Contact {
        Contact(
            title: "Контакты",
            imageName: "person.circle.fill",
            segueID: "showContact"
        )
    }
}

// MARK: - About Us Extension
extension AboutUs {
    static func getAboutUs() -> AboutUs {
        AboutUs(
            title: "О нас",
            imageName: "info.bubble.fill",
            segueID: "showAboutUs",
            description:
                    """
                    «Казань поёт» – онлайн-радио, где круглосуточно звучит музыка артистов, которые считают своей родиной город Казань или всю солнечную Татарию. Челны, Альметьевск, Актаныш, Буинск, все остальные города республики и конечно, столица Казань - все самые крутые музыканты представляют свои лучшие песни на онлайн-радио Казань поёт. Здесь играют хиты тех артистов, которые живут по соседству, и на концерты которых вы можете попасть в любой момент. Музыкантам и слушателям больше не надо искать друг друга - все мы встречаемся на онлайн-радио «Казань поёт». Слушайте наших! Поддержите наших! Делитесь информацией о нас со всеми, кого вы знаете! Чем больше нас, тем ярче наши звезды!
                    """
        )
    }
}

// MARK: - Policy Extension
extension Policy {
    static func getPolicy() -> Policy {
        Policy(
            title: "Политика конфиденциальности",
            imageName: "list.clipboard",
            segueID: "showPolicy",
            description: "Написать политику!!!"
        )
    }
}

// MARK: - Rules Extension
extension Rules {
    static func getRules() -> Rules {
        Rules(
            title: "Правила",
            imageName: "list.bullet.rectangle.fill",
            segueID: "showRules",
            description: "Написать правила!!!"
        )
    }
}
