//
//  BitRate.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

import Foundation

struct BitRate {
    let title: String
    let description: String
    let link: URL
}

extension BitRate {
    static func getBitRate() -> [BitRate] {
        [
            BitRate(
                title: "Низкое",
                description: "64 kb",
                link: URL(string: "https://stream01.hitv.ru:8443/kazansings-64k")!
            ),
            BitRate(
                title: "Среднее",
                description: "128 kb",
                link: URL(string: "https://stream01.hitv.ru:8443/kazansings-128k")!
            ),
            BitRate(
                title: "Высокое",
                description: "192 kb",
                link: URL(string: "https://stream01.hitv.ru:8443/kazansings-192k")!
            ),
            BitRate(
                title: "Очень высокое",
                description: "320 kb",
                link: URL(string: "https://stream01.hitv.ru:8443/kazansings-320k")!
            )
        ]
    }
}
