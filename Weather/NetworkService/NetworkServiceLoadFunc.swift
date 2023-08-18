//
//  Network.swift
//  Weather
//
//  Created by Андрей Банин on 17.8.23..


import Foundation

class NetworkServiceLoadFunc {
    

    private let urlYan = "https://api.weather.yandex.ru/v2/forecast"
    private let headers = ["X-Yandex-API-Key":"4a008062-0c53-450d-a584-132047fd7220"]
    
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
//        print("🟣", lat, lon)
        return (lat, lon)
    }
    
    func loadFunc(city: String, completion: @escaping (Result<CityNameAndWeatherModel, Error>) -> Void) { // ((Result<[Value], Error>) -> Void)) -> Value {
        NetworkService(
            data: headGeo(city: city),
            headers: [:],
            url: urlGeo,
            method: .get,
            isJSONRequest: false
        ).executeQuery() { (result: Result<GeocodeModel,Error>) in
            switch result {
            case .success(let weather):
                let latLon = self.latLon(point: weather.response.geoObjectCollection.featureMember[0].geoObject.point.pos)
                let lat = latLon.0
                let lon = latLon.1
                let cityName = weather.response.geoObjectCollection.featureMember[0].geoObject.name
                print("✅", weather.response.geoObjectCollection.featureMember[0].geoObject)
        
                NetworkService(
                    data: ["lat":lat,
                           "lon":lon,
                           "lang":"ru_RU",
                           "limit":"7",
                           "hours":"true",
                           "extra":"false"] ,
                    headers: self.headers,
                    url: self.urlYan,
                    method: .get,
                    isJSONRequest: false
                ).executeQuery() { (result: Result<NetworkServiceWeatherModel,Error>) in
                    switch result {
                    case .success(let weather):
//                        print("🅿️ info", weather.info)
//                        print("🅿️ fact", weather.fact)
//                            print("🅿️ forecasts", weather.forecasts)
//                            weather.forecasts.forEach{ print($0.date) }
//                        self.state = .loadedWeather(city: cityName, weather: weather)
//                        self.realmService.addCityAndWeather(cityAndWeather: CityNameAndWeatherModel(nameCity: cityName, weather: weather))
                        
                        completion(.success(CityNameAndWeatherModel(nameCity: cityName, weather: weather)))
                    case .failure(let error):
                        print("❌", error)
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                print("🔞", error)
                completion(.failure(error))
            }
        }
    }
}
