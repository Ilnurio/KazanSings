//
//  AboutUs.swift
//  KazanSings
//
//  Created by Ilnur on 05.06.2023.
//

struct AboutUs {
    let statusInTeam: String
    let imageName: [String]
    let nameSurName: [String]
    let link: [String]
    let title: [String]
    
    var introduction: String?
    var description: String?
}

extension AboutUs {
    static func getAboutUs() -> [AboutUs] {
        [
            AboutUs(
                statusInTeam: "Основатель",
                imageName: ["teamlead"],
                nameSurName: ["Андрей Лысяков"],
                link: ["https://vk.com/id96111646", "@Andy_Bald"],
                title: ["Перейти в TG?", "Перейти в VK?"],
                introduction: """
                Режиссер, драматург, автор песен и мюзиклов, генеральный продюсер онлайн-радио «Казань поёт»
                """,
                description: """
                Я придумал этот проект для себя, для своих друзей и коллег. Проект «Казань поёт» создан с целью продвижения артистов, создающих оригинальную музыку в родном регионе. Музыкальная индустрия в России не может существовать и развиваться в моноцентричной системе, когда всякий музыкант должен обязательно переезжать в столицу, чтобы получить шанс стать успешным. Каждый регион заслуживает того, чтобы обладать полным набором элементов музыкальной индустрии. Всякий артист получит выход на массовую аудиторию на своей малой родине без необходимости конкурировать с федеральными звездами. Благодаря онлайн-радио «Казань поёт» можно донести свое творчество до зрителя и анонсировать свои концерты быстро, эффективно и бесплатно. Этот проект не привязан к радиовышкам, не имеет ограниченной зоны охвата и не дает преимуществ состоятельным лейблам и артистам со связями. Так горячие поклонники артистов из Республики Татарстан могут поддержать своих звезд, остальные жители региона получают возможность разнообразить свою культурную жизнь, а гости нашего края – получить представление о нашем музыкальном мире, чтобы заранее планировать свой отдых. Спасибо, что вы с нами! Чем больше нас, тем ярче наши звезды!
                """
            ),
            AboutUs(
                statusInTeam: "IOS Разработчик",
                imageName: ["programmerone", "programmertwo"],
                nameSurName: ["Михаил Бухрашвили", "Ильнур Фаттахов"],
                link: ["https://github.com/GE-Developer", "https://github.com/Ilnurio"],
                title: ["Перейти на GitHub?"]
            )
        ]
    }
}
