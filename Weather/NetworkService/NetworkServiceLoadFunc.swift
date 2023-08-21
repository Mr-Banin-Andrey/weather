
import Foundation
import UIKit

class NetworkServiceLoadFunc {
    

    private let urlYan = "https://api.weather.yandex.ru/v2/forecast"
    private let headers = ["X-Yandex-API-Key":"36395295-7e87-4403-947e-eeb446b60ed2"]
    
    private let urlGeo = "https://geocode-maps.yandex.ru/1.x"
    
    private func headGeo(city: String) -> [String:String] {
        let headersGeo = [
            "apikey":"653bb56c-4ee4-4a72-99cc-9e645a1f5872",
            "geocode":city,
            "lang":"ru_RU",
            "format":"json"
        ]
        return headersGeo
    }
    
    private func latLon(point: String) -> (String, String) {
        let myStringArr = point.components(separatedBy: " ")
        let lon = myStringArr[0]
        let lat = myStringArr[1]
        return (lat, lon)
    }
    
    func loadFunc(city: String, completion: @escaping (Result<CityNameAndWeatherModel, Error>) -> Void) {
        NetworkService(
            data: headGeo(city: city),
            headers: [:],
            url: urlGeo,
            method: .get,
            isJSONRequest: false
        ).executeQuery() { (result: Result<GeocodeModel,Error>) in
            switch result {
            case .success(let weather):
                if !weather.response.geoObjectCollection.featureMember.isEmpty {
                    print("✅ 1", weather)
                    print("✅ 2", weather.response.geoObjectCollection.featureMember[0].geoObject)
                    let latLon = self.latLon(point: weather.response.geoObjectCollection.featureMember[0].geoObject.point.pos)
                    let lat = latLon.0
                    let lon = latLon.1
                    let cityName = weather.response.geoObjectCollection.featureMember[0].geoObject.name
            
                    NetworkService(
                        data: [
                            "lat":lat,
                            "lon":lon,
                            "lang":"ru_RU",
                            "limit":"7",
                            "hours":"true",
                            "extra":"false"
                              ] ,
                        headers: self.headers,
                        url: self.urlYan,
                        method: .get,
                        isJSONRequest: false
                    ).executeQuery() { (result: Result<NetworkServiceWeatherModel,Error>) in
                        switch result {
                        case .success(let weather):
                            completion(.success(CityNameAndWeatherModel(nameCity: cityName, weather: weather)))
                        case .failure(let error):
                            print("❌", error)
                            completion(.failure(error))
                        }
                    }
                } else {
                    print("alert")
                    let alert = UIAlertController(title: "Город не найден", message: nil, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Попробовать ещё раз", style: .default)
                    alert.addAction(action)
                    UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.present(alert, animated: true)
                }
            case .failure(let error):
                print("🔞", error)
                completion(.failure(error))
            }
        }
    }
}
