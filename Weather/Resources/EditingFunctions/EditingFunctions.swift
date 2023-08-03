
import Foundation

class EditingFunctions {
   public let condition = [
        "clear":"ясно",
        "partly-cloudy":"малооблачно",
        "cloudy":"облачно с прояснениями",
        "overcast":"пасмурно",
        "light-rain":"небольшой дождь",
        "rain":"дождь",
        "heavy-rain":"сильный дождь",
        "showers":"ливень",
        "wet-snow":"дождь со снегом",
        "light-snow":"небольшой снег",
        "snow":"снег",
        "snow-showers":"снегопад",
        "hail":"град",
        "thunderstorm":"гроза",
        "thunderstorm-with-rain":"дождь с грозой",
        "thunderstorm-with-hail":"гроза с градом"
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
    
    enum DateFormat: String {
        case dayMonths = "dd/MM"
        case hourMin = "HH:mm"
        case dayWeekDayMonth = "EE dd/MM"
        
//        case
    }
    
    func codeDate(unixTime: Int, dateFormat: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = dateFormat.rawValue
        
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
