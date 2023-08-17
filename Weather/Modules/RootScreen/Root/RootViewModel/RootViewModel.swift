
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
        case loadedWeatherFromCache(cityAndWeather: [CityNameAndWeatherModel])// загрузка по локации или по выбору в алерте города ||(subsequent) фоном загрузка погоды
        case updateWeather(cityAndWeather: [CityNameAndWeatherModel])
        case loadedCity(city: String)
        case loadedWeatherFromNetwork(cityAndWeather: CityNameAndWeatherModel)  //  ||(subsequent)  обновление погоды на Юай
        
        case error(Error)
//        case firstLaunchDoNotUseLocation // первый пуск без допуска к локации
//        case firstLaunchUseLocation // первый пуск с допуском к локации
//        case subsequentLaunch // (subsequent) загрузка из хранилища
//        case selectCity // выбор города в алерте
//        case loadedWeatherAndSaveInCoreDate // ||(subsequent)  добавление обновленной погоды в хранилище
    }
    
    enum ViewInput {
        case loadCityAndWeather
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
    
    private let realmService: RealmServiceProtocol = RealmService()
//    var latLonArray = [Double]()
    
    func updateState(viewInput: RootViewModel.ViewInput) {
        switch viewInput {
        case .loadCityAndWeather:
            let cititsAndWeather = realmService.fetch()
            if !cititsAndWeather.isEmpty {
                self.state = .loadedWeatherFromCache(cityAndWeather: cititsAndWeather)
                // очистить реалм
                // обновить данные
                var weathersArray = [CityNameAndWeatherModel]()
                cititsAndWeather.forEach { cityAndWeather in
                    NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { cityNameAndWeather in
                        weathersArray.append(cityNameAndWeather)
                    }
                }
                state = .updateWeather(cityAndWeather: weathersArray)
            } else {
                state = .initial
            }
        case .buttonSettings:
            print("buttonSettings")
            coordinator?.pushSettingsViewController()
        case let .addCity(city):
            print(city)
            
            NetworkServiceLoadFunc().loadFunc(city: city) { cityNameAndWeather in
                self.state = .loadedWeatherFromNetwork(cityAndWeather: cityNameAndWeather)
                let result = self.realmService.addCityAndWeather(cityAndWeather: CityNameAndWeatherModel(nameCity: cityNameAndWeather.nameCity, weather: cityNameAndWeather.weather))
                print("networkServiceResult -", result)
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
}
