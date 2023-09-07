
import Foundation

protocol RootViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((RootViewModel.State) -> Void)? { get set }
    func updateState(viewInput: RootViewModel.ViewInput)
}

class RootViewModel: RootViewModelProtocol {
    enum State {
        case initial // инициализация
        case selectCity // выбор города в алерте
        case updateWeather // передача погодных данных
        case updatedWeather(cityAndWeather: [CityNameAndWeatherModel]) // загрузка сразу всех городов из сети
        case loadedWeatherFromCache(cityAndWeather: [CityNameAndWeatherModel]) // загрузка из базы сразу всех городов
        case loadedWeatherFromNetwork(cityAndWeather: CityNameAndWeatherModel) // загрузка по одному городу
        case error(Error)
        case sendLocation(cityAndWeather: CityNameAndWeatherModel) // загрузка по локации
    }
    
    enum ViewInput {
        case updateDate
        case loadCityAndWeather
        case buttonSettings
        case buttonAlertSelectCity 
        case addCity(city: String)
        case useLocationCity(lat: Double, lon: Double)
    }
    
    weak var coordinator: RootCoordinator?
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    private let realmService: RealmServiceProtocol = RealmService()
    
    var weathersArray = [CityNameAndWeatherModel]()
    
//    func sendLocation(lat: Double, lon: Double){
////        print("sendLocation", lat, lon)
//        state = .sendLocation(lat: lat, lon: lon)
//    }
    
    
    func updateState(viewInput: RootViewModel.ViewInput) {
        switch viewInput {
            
        case let .useLocationCity(lat, lon):
            NetworkServiceLoadFunc().downloadWeatherInTheCityByCoordinates(lat: lat, lon: lon) { [weak self] resultCityNameAndWeather in
                switch resultCityNameAndWeather {
                case let .success(cityNameAndWeather):
//                    self?.state = .loadedWeatherFromNetwork(cityAndWeather: cityNameAndWeather)
                    self?.state = .sendLocation(cityAndWeather: cityNameAndWeather)
                    let result = self?.realmService.addCityAndWeather(cityAndWeather: CityNameAndWeatherModel(nameCity: cityNameAndWeather.nameCity,
                                                                                                              weather: cityNameAndWeather.weather))
                    print("🔫networkServiceResult -", result)
                    print("🔫cityNameAndWeather -", cityNameAndWeather)

                case let .failure(Error):
                    print(Error)
                }
            }
            self.state = .initial
        case .updateDate:
//            print("updateDate")
            self.state = .updatedWeather(cityAndWeather: self.weathersArray)
        case .loadCityAndWeather:

            let cititsAndWeather = self.realmService.fetch()
//            print("cititsAndWeather count -", cititsAndWeather.count)
            if !cititsAndWeather.isEmpty {

                self.state = .loadedWeatherFromCache(cityAndWeather: cititsAndWeather)

                let downloadGroup = DispatchGroup()
                let clearBase = self.realmService.clearBase()
                print("🛜clearBase", clearBase)
                cititsAndWeather.forEach { cityAndWeather in
                    downloadGroup.enter()
                    NetworkServiceLoadFunc().downloadWeatherInTheCityByName(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
                        downloadGroup.enter()
                        switch resultCityNameAndWeather {
                        case let .success(cityNameAndWeather):
                            self?.weathersArray.append(cityNameAndWeather)
                            let addCityAndWeather = self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
//                            print("addCityAndWeather - ", addCityAndWeather)
                            downloadGroup.leave()
                        case let .failure(Error):
                            print(Error)
                            downloadGroup.leave()
                        }
                        downloadGroup.leave()
                    }
                }
                downloadGroup.notify(queue: DispatchQueue.main) {
                    self.state = .updateWeather
                }


            } else {
                self.state = .initial
            }
        case .buttonSettings:
            coordinator?.pushSettingsViewController()
            
        case let .addCity(city):
            
            NetworkServiceLoadFunc().downloadWeatherInTheCityByName(city: city) { [weak self] resultCityNameAndWeather in
                switch resultCityNameAndWeather {
                case let .success(cityNameAndWeather):
                    self?.state = .loadedWeatherFromNetwork(cityAndWeather: cityNameAndWeather)
                    let result = self?.realmService.addCityAndWeather(cityAndWeather: CityNameAndWeatherModel(nameCity: cityNameAndWeather.nameCity,
                                                                                                              weather: cityNameAndWeather.weather))
                    print("networkServiceResult -", result!)
                case let .failure(Error):
                    print(Error)
                }
            }

            self.state = .initial
        case  .buttonAlertSelectCity:
            self.state = .selectCity
           
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
        }
    }
}
