//
//  Hello.swift
//  KazanSings
//
//  Created by M I C H A E L on 31.05.2023.
//

//let infoTitle =
//"""
//«Казань поёт» – онлайн-радио, где круглосуточно звучит музыка артистов, которые считают своей родиной город Казань или всю солнечную Татарию. Челны, Альметьевск, Актаныш, Буинск, все остальные города республики и конечно, столица Казань - все самые крутые музыканты представляют свои лучшие песни на онлайн-радио Казань поёт. Здесь играют хиты тех артистов, которые живут по соседству, и на концерты которых вы можете попасть в любой момент. Музыкантам и слушателям больше не надо искать друг друга - все мы встречаемся на онлайн-радио «Казань поёт». Слушайте наших! Поддержите наших! Делитесь информацией о нас со всеми, кого вы знаете! Чем больше нас, тем ярче наши звезды!
//"""
//
//let textforShare =
//"""
//Слушайте первое музыкальное онлайн-радио в Татарстане.
//Здесь звучат песни, которые больше нигде не звучат.
//"""

struct Info {
    let contact: Contact
    let aboutUs: AboutUs
    let policy: Policy
    let rules: Rules
}

struct Contact {
    let title: String
    let imageName: String
    let segueID: String
}

struct AboutUs {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}

struct Policy {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}

struct Rules {
    let title: String
    let imageName: String
    let segueID: String
    
    let description: String
}
