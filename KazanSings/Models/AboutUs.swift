//
//  AboutUs.swift
//  KazanSings
//
//  Created by Ilnur on 05.06.2023.
//

import Foundation

struct AboutUs {
    let imageName: String
    let nameSurName: String
    let statusInTeam: String
}

extension AboutUs {
    static func getAboutUs() -> [AboutUs] {
        [AboutUs(
            imageName: "teamlead",
            nameSurName: "Андрей Лысяков",
            statusInTeam: "Tимлид"),
         AboutUs(
            imageName: "programmerone",
            nameSurName: "Михаил Батуми",
            statusInTeam: "IOS Разработчик"),
         AboutUs(
            imageName: "programmertwo",
            nameSurName: "Ильнур Фаттахов",
            statusInTeam: "IOS Разработчик")
        ]
    }
}
