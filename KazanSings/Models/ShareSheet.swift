//
//  ShareSheet.swift
//  KazanSings
//
//  Created by Ilnur on 04.06.2023.
//

struct ShareSheet {
    let title: String
    let image: String
    let link: String
}

extension ShareSheet {
    static func getShareSheet() -> ShareSheet {
        ShareSheet(
            title: """
                    Слушайте первое музыкальное онлайн-радио в Татарстане.
                    Здесь звучат песни, которые больше нигде не звучат.
                    """,
            image: "logosheet.jpg",
            link: "https://www.kazansings.ru/"
        )
    }
}
