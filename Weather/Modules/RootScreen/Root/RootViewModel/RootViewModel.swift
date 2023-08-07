
import Foundation

protocol RootViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((RootViewModel.State) -> Void)? { get set }
    func updateState(viewInput: RootViewModel.ViewInput)
}

class RootViewModel: RootViewModelProtocol {
    enum State {
        //загрузка погоды (в момент первого пуска показать данные по умолчанию)
        case initial // 1.
        case selectCity // выбор города в алерте
        case loadWeather// загрузка по локации или по выбору в алерте города ||(subsequent) фоном загрузка погоды
        case loadedCity(city: String)
        case loadedWeather(weather: [NetworkServiceWeatherModel])  //  ||(subsequent)  обновление погоды на Юай
        
        case error(Error)
//        case firstLaunchDoNotUseLocation // первый пуск без допуска к локации
//        case firstLaunchUseLocation // первый пуск с допуском к локации
//        case subsequentLaunch // (subsequent) загрузка из хранилища
//        case selectCity // выбор города в алерте
//        case loadedWeatherAndSaveInCoreDate // ||(subsequent)  добавление обновленной погоды в хранилище
    }
    
    enum ViewInput {
        case buttonSettings
        case buttonAlertSelectCity //(word: String)
        case addCity(city: String)
    }
    
    weak var coordinator: RootCoordinator?
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    
    func updateState(viewInput: RootViewModel.ViewInput) {
        switch viewInput {
        case .buttonSettings:
            print("buttonSettings")
            coordinator?.pushSettingsViewController()
        case let .addCity(city):
            print(city)
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
                            print("🅿️", weather.now, weather.now_dt)
                            print("🅿️ info", weather.info)
                            print("🅿️ fact", weather.fact)
                            print("🅿️ forecasts", weather.forecasts.count)
                            print("🅿️ forecasts", weather.forecasts)
//                            weather.forecasts.forEach{ print($0.date) }
//                            weather.forecasts.forEach{ print($0.date_ts) }
                            weather.forecasts.forEach{ print($0.parts) }
//                            weather.forecasts.forEach{ print($0.hours) }
                            //класс.массив.forEach { код }
//                            print(city1)
                            self.state = .loadedCity(city: cityName)
                            self.state = .loadedWeather(weather: [weather])
                    
                        case .failure(let error):
                            print("❌", error)
                        }
                    }
                case .failure(let error):
                    print("🔞", error)
                }
            }

            state = .initial
        case  .buttonAlertSelectCity:
            state = .selectCity
        }
    }
    private func latLon(point: String) -> (String, String) {
        let myStringArr = point.components(separatedBy: " ")
        let lon = myStringArr[0]
        let lat = myStringArr[1]
        print("🟣", lat, lon)
        return (lat, lon)
    }

    let urlYan = "https://api.weather.yandex.ru/v2/forecast"
    let headers = ["X-Yandex-API-Key":"4a008062-0c53-450d-a584-132047fd7220"]
    
    let urlGeo = "https://geocode-maps.yandex.ru/1.x"
    func headGeo(city: String) -> [String:String] {
        let headersGeo = [
            "apikey":"653bb56c-4ee4-4a72-99cc-9e645a1f5872",
            "geocode":city,
            "lang":"ru_RU",
            "format":"json"
        ]
        print(headersGeo)
        return headersGeo
    }
}
