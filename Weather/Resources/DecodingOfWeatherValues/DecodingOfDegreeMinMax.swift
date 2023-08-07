
import Foundation

enum Separator: String {
    case slash = "/"
    case dash = "-"
}

class DecodingOfDegreeMinMax {
    
    static let shared = DecodingOfDegreeMinMax()
    
    private init() {}
    
    func minToMaxDegree(weather: NetworkServiceWeatherModel, index: Int, separator: Separator) -> String {
        
        let night = weather.forecasts[index].parts.night
        let morning = weather.forecasts[index].parts.morning
        let day = weather.forecasts[index].parts.day
        let evening = weather.forecasts[index].parts.evening
        
        let nightMin = night.temp_min
        let nightMax = night.temp_max
        
        let morningMin = morning.temp_min
        let morningMax = morning.temp_max
        
        let dayMin = day.temp_min
        let dayMax = day.temp_max
        
        let eveningMin = evening.temp_min
        let eveningMax = evening.temp_max
        
        let degreeArray = [nightMin, nightMax, morningMin, morningMax, dayMin, dayMax, eveningMin, eveningMax]
        
        let max = degreeArray.max()
        let min = degreeArray.min()
        
        guard let min = min,
              let max = max
        else { return ""}
        
        return "\(String(min))°\(separator.rawValue)\(String(max))°"
    }
    
    //func celsiusToFahrenheit(degree: Int) -> String {
    //    let tempC = Double(degree)
    //    let tempF = 9.0 / 5.0 * tempC + 32.0
    //    return "\(tempF)°"
    //}
}
