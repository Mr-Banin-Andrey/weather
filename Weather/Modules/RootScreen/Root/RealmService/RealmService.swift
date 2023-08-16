
import Foundation
import RealmSwift

protocol RealmServiceProtocol: AnyObject {
    func createCityAndWeather(weather: NameCityAndWeatherRealmModel) -> Bool
    func fetch() -> [CityNameAndWeatherModel]
//    func removeUser(user: CityNameAndWeatherModel) -> Bool
}

class RealmService {
    
}

extension RealmService: RealmServiceProtocol {
    func createCityAndWeather(weather: NameCityAndWeatherRealmModel) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(weather)
            }
            return true
        } catch let error {
            print("Error: \(error)")
            return false
        }
    }
    
    func fetch() -> [CityNameAndWeatherModel] {

        do {
            let realm = try Realm()
            let weather = realm.objects(NameCityAndWeatherRealmModel.self)
            guard let weathers = Array(weather) as? [NameCityAndWeatherRealmModel] else {
                return []
            }
            return weathers.map { CityNameAndWeatherModel(
                nameCity: $0.city ?? "",
                weather: convertWeatherModelRealmToModel(weather: $0.weather)) }
        } catch let error{
            print("Error: \(error)")
            return []
        }
    }
    
    private func convertWeatherModelRealmToModel(weather: WeatherModelRealm?) ->  NetworkServiceWeatherModel {
        if let weather = weather {
            
            var forecasts = [Forecasts]()
            weather.forecasts.forEach { fore in
                var hours = [Hours]()
                fore.hours.forEach { hour in
                    hours.append(Hours(hour: hour.hour ?? "",
                                       hour_ts: hour.hour_ts ?? 0,
                                       cloudness: hour.cloudness ?? 0.0,
                                       condition: hour.condition ?? "",
                                       feels_like: hour.feels_like ?? 0,
                                       prec_type: hour.prec_type ?? 0.0,
                                       prec_strength: hour.prec_strength ?? 0.0,
                                       temp: hour.temp ?? 0,
                                       wind_dir: hour.wind_dir ?? "",
                                       wind_speed: hour.wind_speed ?? 0.0,
                                       is_thunder: hour.is_thunder ?? false))
                }
                
                forecasts.append(Forecasts(date: fore.date ?? "",
                                           date_ts: fore.date_ts ?? 0,
                                           rise_begin: fore.rise_begin,
                                           set_end: fore.set_end,
                                           moon_code: fore.moon_code ?? 0,
                                           moon_text: fore.moon_text ?? "",
                                           parts: Parts(night: Night(
                                                                cloudness: fore.parts?.night?.cloudness ?? 0.0,
                                                                condition: fore.parts?.night?.condition ?? "",
                                                                feels_like: fore.parts?.night?.feels_like ?? 0,
                                                                prec_type: fore.parts?.night?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.night?.prec_strength ?? 0.0,
                                                                temp_avg: fore.parts?.night?.temp_avg ?? 0,
                                                                temp_max: fore.parts?.night?.temp_max ?? 0,
                                                                temp_min: fore.parts?.night?.temp_min ?? 0,
                                                                uv_index: fore.parts?.night?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.night?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.night?.wind_speed ?? 0.0),
                                                        morning: Morning(
                                                                cloudness: fore.parts?.morning?.cloudness ?? 0.0,
                                                                condition: fore.parts?.morning?.condition ?? "",
                                                                feels_like: fore.parts?.morning?.feels_like ?? 0,
                                                                prec_type: fore.parts?.morning?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.morning?.prec_strength ?? 0.0,
                                                                temp_avg: fore.parts?.morning?.temp_avg ?? 0,
                                                                temp_max: fore.parts?.morning?.temp_max ?? 0,
                                                                temp_min: fore.parts?.morning?.temp_min ?? 0,
                                                                uv_index: fore.parts?.morning?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.morning?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.morning?.wind_speed ?? 0.0),
                                                        day: DayWeather(
                                                                cloudness: fore.parts?.day?.cloudness ?? 0.0,
                                                                condition: fore.parts?.day?.condition ?? "",
                                                                feels_like: fore.parts?.day?.feels_like ?? 0,
                                                                prec_type: fore.parts?.day?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.day?.prec_strength ?? 0.0,
                                                                temp_avg: fore.parts?.day?.temp_avg ?? 0,
                                                                temp_max: fore.parts?.day?.temp_max ?? 0,
                                                                temp_min: fore.parts?.day?.temp_min ?? 0,
                                                                uv_index: fore.parts?.day?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.day?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.day?.wind_speed ?? 0.0),
                                                        evening: Evening(
                                                                cloudness: fore.parts?.evening?.cloudness ?? 0.0,
                                                                condition: fore.parts?.evening?.condition ?? "",
                                                                feels_like: fore.parts?.evening?.feels_like ?? 0,
                                                                prec_type: fore.parts?.evening?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.evening?.prec_strength ?? 0.0,
                                                                temp_avg: fore.parts?.evening?.temp_avg ?? 0,
                                                                temp_max: fore.parts?.evening?.temp_max ?? 0,
                                                                temp_min: fore.parts?.evening?.temp_min ?? 0,
                                                                uv_index: fore.parts?.evening?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.evening?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.evening?.wind_speed ?? 0.0),
                                                        day_short: DayShort(
                                                                cloudness: fore.parts?.day_short?.cloudness ?? 0.0,
                                                                condition: fore.parts?.day_short?.condition ?? "",
                                                                feels_like: fore.parts?.day_short?.feels_like ?? 0,
                                                                prec_type: fore.parts?.day_short?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.day_short?.prec_strength ?? 0.0,
                                                                temp: fore.parts?.day_short?.temp ?? 0,
                                                                temp_min: fore.parts?.day_short?.temp_min ?? 0,
                                                                uv_index: fore.parts?.day_short?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.day_short?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.day_short?.wind_speed ?? 0.0),
                                                        night_short: NightShort(
                                                                cloudness: fore.parts?.night_short?.cloudness ?? 0.0,
                                                                condition: fore.parts?.night_short?.condition ?? "",
                                                                feels_like: fore.parts?.night_short?.feels_like ?? 0,
                                                                prec_type: fore.parts?.night_short?.prec_type ?? 0.0,
                                                                prec_strength: fore.parts?.night_short?.prec_strength ?? 0.0,
                                                                temp: fore.parts?.night_short?.temp ?? 0,
                                                                uv_index: fore.parts?.night_short?.uv_index ?? 0,
                                                                wind_dir: fore.parts?.night_short?.wind_dir ?? "",
                                                                wind_speed: fore.parts?.night_short?.wind_speed ?? 0.0)
                                           ),
                                           hours: hours
                                          ))
            }
            
            return NetworkServiceWeatherModel(
                now: weather.now ?? 0,
                now_dt: weather.now_dt ?? "",
                info: Info(
                    lat: weather.info?.lat ?? 0.0,
                    lon: weather.info?.lon ?? 0.0,
                    tzinfo: Tzinfo(
                        offset: weather.info?.tzinfo?.offset ?? 0,
                        name: weather.info?.tzinfo?.name ?? "",
                        abbr: weather.info?.tzinfo?.abbr ?? "",
                        dst: weather.info?.tzinfo?.dst ?? false
                    )
                ),
                fact: Fact(
                    temp: weather.fact?.temp ?? 0,
                    wind_speed: weather.fact?.wind_speed ?? 0.0,
                    wind_dir: weather.fact?.wind_dir ?? "",
                    uv_index: weather.fact?.uv_index ?? 0,
                    condition: weather.fact?.condition ?? "",
                    prec_strength: weather.fact?.prec_strength ?? 0.0,
                    feels_like: weather.fact?.feels_like ?? 0,
                    cloudness: weather.fact?.cloudness ?? 0.0,
                    is_thunder: weather.fact?.is_thunder ?? false
                ),
                forecasts: forecasts
            )
        }
        return NetworkServiceWeatherModel(now: 0, now_dt: "", info: Info(lat: 0.0, lon: 0.0, tzinfo: Tzinfo(offset: 0, name: "", abbr: "", dst: false)), fact: Fact(temp: 0, wind_speed: 0.0, wind_dir: "", uv_index: 0, condition: "", prec_strength: 0.0, feels_like: 0, cloudness: 0.0, is_thunder: false), forecasts: [Forecasts(date: "", date_ts: 0, rise_begin: nil, set_end: nil, moon_code: 0, moon_text: "", parts: Parts(night: Night(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp_avg: 0, temp_max: 0, temp_min: 0, uv_index: nil, wind_dir: nil, wind_speed: nil), morning: Morning(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp_avg: 0, temp_max: 0, temp_min: 0, uv_index: nil, wind_dir: nil, wind_speed: nil), day: DayWeather(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp_avg: 0, temp_max: 0, temp_min: 0, uv_index: nil, wind_dir: nil, wind_speed: nil), evening: Evening(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp_avg: 0, temp_max: 0, temp_min: 0, uv_index: nil, wind_dir: nil, wind_speed: nil), day_short: DayShort(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp: 0, temp_min: 0, uv_index: nil, wind_dir: nil, wind_speed: nil), night_short: NightShort(cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp: 0, uv_index: nil, wind_dir: nil, wind_speed: nil)), hours: [Hours(hour: "", hour_ts: 0, cloudness: 0.0, condition: "", feels_like: 0, prec_type: 0.0, prec_strength: 0.0, temp: 0, wind_dir: nil, wind_speed: nil, is_thunder: false)])])
    }
    
//    func removeUser(user: CityNameAndWeatherModel) -> Bool {
//        <#code#>
//    }
    
    
}
