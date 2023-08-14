
import Foundation

protocol RealmServiceProtocol: AnyObject {
    func createUser(user: CityNameAndWeatherModel) -> Bool
    func fetch() -> [CityNameAndWeatherModel]
    func removeUser(user: CityNameAndWeatherModel) -> Bool
}

class RealmService {
    
}

extension RealmService: RealmServiceProtocol {
    func createUser(user: CityNameAndWeatherModel) -> Bool {
        <#code#>
    }
    
    func fetch() -> [CityNameAndWeatherModel] {
        <#code#>
    }
    
    func removeUser(user: CityNameAndWeatherModel) -> Bool {
        <#code#>
    }
    
    
}
