
import Foundation

struct PermissionToUseLocationModel {
    let firstParagraph: String
    let secondParagraph: String
    let thirdParagraph: String
}


struct TextTitle {
    let textTitle: [PermissionToUseLocationModel] = [
        PermissionToUseLocationModel(
            firstParagraph: "Разрешить приложению  Weather использовать данные о местоположении вашего устройства ",
            secondParagraph: "Чтобы получить более точные прогнозы погоды во время движения или путешествия",
            thirdParagraph: "Вы можете изменить свой выбор в любое время из меню приложения"
        )
    ]
}
