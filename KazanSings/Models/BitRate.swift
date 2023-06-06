//
//  BitRate.swift
//  KazanSings
//
//  Created by M I C H A E L on 06.06.2023.
//

struct BitRate {
    let title: String
    let description: String
    let link: BitRateURL
}

extension BitRate {
    static func getBitRate() -> [BitRate] {
        [
            BitRate(
                title: "Низкое",
                description: "64 kb",
                link: BitRateURL.bad
            ),
            BitRate(
                title: "Среднее",
                description: "128 kb",
                link: BitRateURL.middle
            ),
            BitRate(
                title: "Высокое",
                description: "192 kb",
                link: BitRateURL.good
            ),
            BitRate(
                title: "Очень высокое",
                description: "320 kb",
                link: BitRateURL.great
            )
        ]
    }
}
