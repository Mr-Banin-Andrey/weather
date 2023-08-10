
import Foundation

enum Separator: String {
    case slash = "/"
    case dash = "-"
}

class DecodingOfGradus {
    
    static let shared = DecodingOfGradus()
    
    private init() {}
    
    func minToMaxGradus(weather: NetworkServiceWeatherModel, index: Int, separator: Separator, toFahrenheit: String) -> String {
        
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
        
        let gradusArray = [nightMin, nightMax, morningMin, morningMax, dayMin, dayMax, eveningMin, eveningMax]
        
        let max = gradusArray.max()
        let min = gradusArray.min()
        
        guard
            let min = min,
            let max = max
        else { return ""}
        
        if toFahrenheit == "F" {
            let min = Double(min)
            let minF = 9.0 / 5.0 * min + 32.0
            
            let max = Double(max)
            let maxF = 9.0 / 5.0 * max + 32.0
            
            let tempMin = String(format: "%.1f", minF)
            let tempMax = String(format: "%.1f", maxF)
            
            return "\(tempMin)°\(separator.rawValue)\(tempMax)°"
        } else {
            return "\(String(min))°\(separator.rawValue)\(String(max))°"
        }
    }
    
    
    func celsiusToFahrenheit(gradus: Int, toFahrenheit: String) -> String {
        if toFahrenheit == "F" {
            let tempC = Double(gradus)
            let tempF = 9.0 / 5.0 * tempC + 32.0
            let temp = String(format: "%.1f", tempF)
            
            return "\(temp)°"
        } else {
            return "\(gradus)°"
        }
    }
}
