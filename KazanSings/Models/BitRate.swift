//
//  BitRate.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

struct BitRate {
    let title: String
    let description: String
    let link: String
}

extension BitRate {
    static func getBitRate() -> [BitRate] {
        [
            BitRate(
                title: "Низкое качество",
                description: "64 kb",
                link: "https://stream01.hitv.ru:8443/kazansings-64kb"
            ),
            BitRate(
                title: "Низкое качество",
                description: "128 kb",
                link: "https://stream01.hitv.ru:8443/kazansings-128kb"
            ),
            BitRate(
                title: "Низкое качество",
                description: "192 kb",
                link: "https://stream01.hitv.ru:8443/kazansings-192kb"
            ),
            BitRate(
                title: "Низкое качество",
                description: "320 kb",
                link: "https://stream01.hitv.ru:8443/kazansings-320kb"
            )
        ]
    }
}
