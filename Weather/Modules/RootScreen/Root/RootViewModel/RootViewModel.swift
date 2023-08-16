
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
        case loadedWeather(city: String, weather: NetworkServiceWeatherModel)  //  ||(subsequent)  обновление погоды на Юай
        
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
    
//    var latLonArray = [Double]()
    
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
                            print("🅿️ info", weather.info)
                            print("🅿️ fact", weather.fact)
//                            print("🅿️ forecasts", weather.forecasts)
//                            weather.forecasts.forEach{ print($0.date) }
                            self.state = .loadedWeather(city: cityName, weather: weather)
                    
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
            
           
//            let permissionToUse = PermissionToUseLocationViewController()
//            //permissionToUse.delegateRoot = self
//               permissionToUse.tapAction = { [weak self] result in
//                    guard let self = self else {
//                       return
//                    }
////            permissionToUse.tapAction = { [unowned self] result in
//                print("result -", result)
//            //permissionToUse.tapAction = { lat, lon in
//            ////
//            //self.latLonArray.append(lat)
//            //self.latLonArray.append(lon)
//            //print("1 📫📗 latAndlon", lat, lon)
//            }
//            //
//            //print("2 📫📗 latAndlon", latLonArray)

            state = .selectCity
        }
    }
    
    private func convertWeather(weather: NetworkServiceWeatherModel) -> WeatherModelRealm {
        
        var forecastsModelRealm = [ForecastsModelRealm]()
        
        weather.forecasts.forEach { fore in
            var hoursModelRealm = [HoursModelRealm]()
            fore.hours.forEach { hour in
                hoursModelRealm.append(HoursModelRealm(hour: hour.hour,
                                                       hour_ts: hour.hour_ts,
                                                       cloudness: hour.cloudness,
                                                       condition: hour.condition,
                                                       feels_like: hour.feels_like,
                                                       prec_type: hour.prec_type,
                                                       prec_strength: hour.prec_strength,
                                                       temp: hour.temp,
                                                       wind_dir: hour.wind_dir ?? "",
                                                       wind_speed: hour.wind_speed ?? 0.0,
                                                       is_thunder: hour.is_thunder))
            }
            forecastsModelRealm.append(ForecastsModelRealm(date: fore.date,
                                                           date_ts: fore.date_ts,
                                                           rise_begin: fore.rise_begin ?? "",
                                                           set_end: fore.set_end ?? "",
                                                           moon_code: fore.moon_code,
                                                           moon_text: fore.moon_text,
                                                           parts: PartsModelRealm(night: NightModelRealm(
                                                                                         cloudness: fore.parts.night.cloudness ,
                                                                                         condition: fore.parts.night.condition,
                                                                                         feels_like: fore.parts.night.feels_like,
                                                                                         prec_type: fore.parts.night.prec_type,
                                                                                         prec_strength: fore.parts.night.prec_strength,
                                                                                         temp_avg: fore.parts.night.temp_avg,
                                                                                         temp_max: fore.parts.night.temp_max,
                                                                                         temp_min: fore.parts.night.temp_min,
                                                                                         uv_index: fore.parts.night.uv_index ?? 0,
                                                                                         wind_dir: fore.parts.night.wind_dir ?? "",
                                                                                         wind_speed: fore.parts.night.wind_speed ?? 0.0),
                                                                                  morning: MorningModelRealm(
                                                                                        cloudness: fore.parts.morning.cloudness,
                                                                                        condition: fore.parts.morning.condition,
                                                                                        feels_like: fore.parts.morning.feels_like,
                                                                                        prec_type: fore.parts.morning.prec_type,
                                                                                        prec_strength: fore.parts.morning.prec_strength,
                                                                                        temp_avg: fore.parts.morning.temp_avg,
                                                                                        temp_max: fore.parts.morning.temp_max,
                                                                                        temp_min: fore.parts.morning.temp_min,
                                                                                        uv_index: fore.parts.morning.uv_index ?? 0,
                                                                                        wind_dir: fore.parts.morning.wind_dir ?? "",
                                                                                        wind_speed: fore.parts.morning.wind_speed ?? 0.0),
                                                                                  day: DayWeatherModelRealm(
                                                                                        cloudness: fore.parts.day.cloudness,
                                                                                        condition: fore.parts.day.condition,
                                                                                        feels_like: fore.parts.day.feels_like,
                                                                                        prec_type: fore.parts.day.prec_type,
                                                                                        prec_strength: fore.parts.day.prec_strength,
                                                                                        temp_avg: fore.parts.day.temp_avg,
                                                                                        temp_max: fore.parts.day.temp_max,
                                                                                        temp_min: fore.parts.day.temp_min,
                                                                                        uv_index: fore.parts.day.uv_index ?? 0,
                                                                                        wind_dir: fore.parts.day.wind_dir ?? "",
                                                                                        wind_speed: fore.parts.day.wind_speed ?? 0.0),
                                                                                  evening: EveningModelRealm(
                                                                                        cloudness: fore.parts.evening.cloudness ,
                                                                                        condition: fore.parts.evening.condition ,
                                                                                        feels_like: fore.parts.evening.feels_like ,
                                                                                        prec_type: fore.parts.evening.prec_type ,
                                                                                        prec_strength: fore.parts.evening.prec_strength,
                                                                                        temp_avg: fore.parts.evening.temp_avg,
                                                                                        temp_max: fore.parts.evening.temp_max,
                                                                                        temp_min: fore.parts.evening.temp_min,
                                                                                        uv_index: fore.parts.evening.uv_index ?? 0,
                                                                                        wind_dir: fore.parts.evening.wind_dir ?? "",
                                                                                        wind_speed: fore.parts.evening.wind_speed ?? 0.0),
                                                                                  day_short: DayShortModelRealm(
                                                                                        cloudness: fore.parts.day_short.cloudness,
                                                                                        condition: fore.parts.day_short.condition,
                                                                                        feels_like: fore.parts.day_short.feels_like,
                                                                                        prec_type: fore.parts.day_short.prec_type,
                                                                                        prec_strength: fore.parts.day_short.prec_strength,
                                                                                        temp: fore.parts.day_short.temp,
                                                                                        temp_min: fore.parts.day_short.temp_min,
                                                                                        uv_index: fore.parts.day_short.uv_index ?? 0,
                                                                                        wind_dir: fore.parts.day_short.wind_dir ?? "",
                                                                                        wind_speed: fore.parts.day_short.wind_speed ?? 0.0),
                                                                                  night_short: NightShortModelRealm(
                                                                                        cloudness: fore.parts.night_short.cloudness,
                                                                                        condition: fore.parts.night_short.condition,
                                                                                        feels_like: fore.parts.night_short.feels_like,
                                                                                        prec_type: fore.parts.night_short.prec_type,
                                                                                        prec_strength: fore.parts.night_short.prec_strength,
                                                                                        temp: fore.parts.night_short.temp,
                                                                                        uv_index: fore.parts.night_short.uv_index ?? 0,
                                                                                        wind_dir: fore.parts.night_short.wind_dir ?? "",
                                                                                        wind_speed: fore.parts.night_short.wind_speed ?? 0.0)
                                                           ),
                                                           hours: hoursModelRealm
                                                          ))
        }
        
        let weather = WeatherModelRealm(
            now: weather.now,
            now_dt: weather.now_dt,
            info: InfoModelRealm(
                lat: weather.info.lat,
                lon: weather.info.lon,
                tzinfo: TzinfoModelRealm(
                    offset: weather.info.tzinfo.offset,
                    name: weather.info.tzinfo.name,
                    abbr: weather.info.tzinfo.abbr,
                    dst: weather.info.tzinfo.dst
                )),
            fact: FactModelRealm(
                temp: weather.fact.temp,
                wind_speed: weather.fact.wind_speed,
                wind_dir: weather.fact.wind_dir,
                uv_index: weather.fact.uv_index ,
                condition: weather.fact.condition,
                prec_strength: weather.fact.prec_strength,
                feels_like: weather.fact.feels_like,
                cloudness: weather.fact.cloudness,
                is_thunder: weather.fact.is_thunder
            ),
            forecasts: forecastsModelRealm
        )
        
        return weather
    }
    
    private func latLon(point: String) -> (String, String) {
        let myStringArr = point.components(separatedBy: " ")
        let lon = myStringArr[0]
        let lat = myStringArr[1]
//        print("🟣", lat, lon)
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
        return headersGeo
    }
}
