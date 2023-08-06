
import Foundation

enum DateFormat: String {
    case dayMonths = "dd/MM"
    case hourMin = "HH:mm"
    case dayWeekDayMonth = "EE dd/MM"
    case hourMinDayWeekDayMonth = "HH:mm, EE dd MMMM"
    case hour = "HH"
}

class DecodingOfDate {
    
    static let shared = DecodingOfDate()
    
    private init() {}
    
    func codeDate(unixTime: Int, dateFormat: DateFormat, secondsFromGMT: Int) -> String {
        
        guard let timeZone = TimeZone(secondsFromGMT: secondsFromGMT) else { return "errorTime" }
        
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = .some(timeZone)
        
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
