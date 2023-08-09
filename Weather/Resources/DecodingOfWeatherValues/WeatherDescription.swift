
import Foundation

class WeatherDescription {
   public let condition = [
        "clear":"Ясно",
        "partly-cloudy":"Малооблачно",
        "cloudy":"Облачно с прояснениями",
        "overcast":"Пасмурно",
        "light-rain":"Небольшой дождь",
        "rain":"Дождь",
        "heavy-rain":"Сильный дождь",
        "showers":"Ливень",
        "wet-snow":"Дождь со снегом",
        "light-snow":"Небольшой снег",
        "snow":"Снег",
        "snow-showers":"Снегопад",
        "hail":"Град",
        "thunderstorm":"Гроза",
        "thunderstorm-with-rain":"Дождь с грозой",
        "thunderstorm-with-hail":"Гроза с градом"
    ]
    
    public let windDir = [
        "nw":"сз",
        "n":"с",
        "ne":"св",
        "e":"в",
        "se":"юв",
        "s":"ю",
        "sw":"юз",
        "w":"з",
        "c":"ш"
    ]
    
    public let precipitationOrCloudness = [
        0.0:"0%",
        0.25:"25%",
        0.5:"50%",
        0.75:"75%",
        1.0:"100%"
    ]
    
    public func uvIndexDescription(_ uvIndex: Int) -> String {
        switch uvIndex {
        case 0...2:
            return "\(uvIndex)(низкий)"
        case 3...5:
            return "\(uvIndex)(умерен.)"
        case 6...7:
            return "\(uvIndex)(высокий)"
        case 8...10:
            return "\(uvIndex)(очень выс.)"
        case 11...:
            return "\(uvIndex)(экстрем.)"
        default:
            ()
        }
        return String()
    }
    
    public let moonText = [
        "moon-code-0":"полнолуние",
        "moon-code-1":"убывающая луна",
        "moon-code-2":"убывающая луна",
        "moon-code-3":"убывающая луна",
        "moon-code-4":"последняя четверть",
        "moon-code-5":"убывающая луна",
        "moon-code-6":"убывающая луна",
        "moon-code-7":"убывающая луна",
        "moon-code-8":"новолуние",
        "moon-code-9":"растущая луна",
        "moon-code-10":"растущая луна",
        "moon-code-11":"растущая луна",
        "moon-code-12":"первая четверть",
        "moon-code-13":"растущая луна",
        "moon-code-14":"растущая луна",
        "moon-code-15":"растущая луна"
    ]
}
