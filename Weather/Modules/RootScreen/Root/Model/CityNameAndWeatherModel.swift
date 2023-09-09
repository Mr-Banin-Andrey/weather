
import Foundation

struct CityNameAndWeatherModel {
    let nameCity: String
    let weather: NetworkServiceWeatherModel
    
    
    init(nameCity: String, weather: NetworkServiceWeatherModel) {
        self.nameCity = nameCity
        self.weather = weather
    }
}
