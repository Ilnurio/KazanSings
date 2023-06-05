//
//  AboutUs.swift
//  KazanSings
//
//  Created by Ilnur on 05.06.2023.
//

enum LinkName {
    case vk
    case telegram
    case github
}

struct AboutUs {
    let imageName: String
    let nameSurName: String
    let statusInTeam: String
    let link: [LinkName: String]
    
    var description: String?
}

extension AboutUs {
    static func getAboutUs() -> [AboutUs] {
        [
            AboutUs(
            imageName: "teamlead",
            nameSurName: "Андрей Лысяков",
            statusInTeam: "Tимлид",
            link: [.vk: "", .telegram: ""],
            description: ""),
         AboutUs(
            imageName: "programmerone",
            nameSurName: "Михаил Бухрашвили",
            statusInTeam: "IOS Разработчик",
            link: [.github: "https://github.com/GE-Developer"]),
         AboutUs(
            imageName: "programmertwo",
            nameSurName: "Ильнур Фаттахов",
            statusInTeam: "IOS Разработчик",
            link: [.github: ""])
        ]
    }
}
