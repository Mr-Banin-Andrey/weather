
import Foundation

enum DateFormat: String {
    case dayMonths = "dd/MM"
    case dayWeekDayMonth = "EE dd/MM"
    case hour = "HH"
}

enum TimeFormat {
    case hourMinDayWeekDayMonth
    case hourMin
}

class DecodingOfDate {
        
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
    
    func codeTime(unixTime: Int, secondsFromGMT: Int, timeFormat: TimeFormat, AmPm: String) -> String {
        guard let timeZone = TimeZone(secondsFromGMT: secondsFromGMT) else { return "errorTime" }
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        switch timeFormat {
        case .hourMinDayWeekDayMonth:
            if AmPm == "12" {
                dateFormatter.dateFormat = "hh:mm a, EE dd MMMM"
            } else {
                dateFormatter.dateFormat = "HH:mm, EE dd MMMM"
            }
            dateFormatter.timeZone = .some(timeZone)
            let localDate = dateFormatter.string(from: date)
            return localDate
        case .hourMin:
            if AmPm == "12" {
                dateFormatter.dateFormat = "hh:mm a"
                dateFormatter.timeZone = .some(timeZone)
                let localDate = dateFormatter.string(from: date)
                return convertTimeToTwoOfLines(time: localDate)
            } else {
                dateFormatter.dateFormat = "HH:mm"
                dateFormatter.timeZone = .some(timeZone)
                let localDate = dateFormatter.string(from: date)
                return localDate
            }
        }
    }
    
    func convertTimeFormater(time: String?, AmPm: String, twoLines: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard
            let time = time,
            let date = dateFormatter.date(from: time) else { return "" }
        if AmPm == "12" {
            dateFormatter.dateFormat = "hh:mm a"
            
            if twoLines {
                return convertTimeToTwoOfLines(time: dateFormatter.string(from: date))
            }
            return dateFormatter.string(from: date)
        } else {
            return dateFormatter.string(from: date)
        }
    }
    
    func convertTimeToTwoOfLines(time: String) -> String {
        let time = time.components(separatedBy: " ")
        return "\(time[0]) \n\(time[1])"
    }
}
