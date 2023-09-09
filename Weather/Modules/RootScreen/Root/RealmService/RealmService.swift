
import Foundation
import RealmSwift

protocol RealmServiceProtocol: AnyObject {
    func addCityAndWeather(cityAndWeather: CityNameAndWeatherModel) -> Bool
    func fetch() -> [CityNameAndWeatherModel]
    func clearBase() -> Bool
}

class RealmService {
    
}

extension RealmService: RealmServiceProtocol {
    func addCityAndWeather(cityAndWeather: CityNameAndWeatherModel) -> Bool {
        let cityAndWeather = NameCityAndWeatherRealmModel(city: cityAndWeather.nameCity,
                                                          weather: ConvertWeatherModels().modelToModelRealm(weather: cityAndWeather.weather))
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(cityAndWeather)
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
                weather: ConvertWeatherModels().modelRealmToModel(weather: $0.weather)) }
        } catch let error{
            print("Error: \(error)")
            return []
        }
    }
    
    func clearBase() -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
            return true
        } catch let error {
            print("Error: \(error)")
            return false
        }
    }
    
}
