
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
        case updateWeather
        case updatedWeather(cityAndWeather: [CityNameAndWeatherModel]) // загрузка сразу всех городов из сети
        case loadedWeatherFromCache(cityAndWeather: [CityNameAndWeatherModel]) // загрузка из базы сразу всех городов
        case loadedWeatherFromNetwork(cityAndWeather: CityNameAndWeatherModel) // загрузка по одному городу
        case error(Error)
    }
    
    enum ViewInput {
        case updateDate
        case loadCityAndWeather
        case buttonSettings
        case buttonAlertSelectCity 
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
    
    var weathersArray = [CityNameAndWeatherModel]()
    
    func updateState(viewInput: RootViewModel.ViewInput) {
        switch viewInput {
        case .updateDate:
            print("updateDate")
            self.state = .updatedWeather(cityAndWeather: self.weathersArray)
        case .loadCityAndWeather:

            let cititsAndWeather = self.realmService.fetch()
            print("cititsAndWeather count -", cititsAndWeather.count)
            if !cititsAndWeather.isEmpty {

                self.state = .loadedWeatherFromCache(cityAndWeather: cititsAndWeather)

                let downloadGroup = DispatchGroup()
                let clearBase = self.realmService.clearBase()
                print("🛜clearBase", clearBase)
                cititsAndWeather.forEach { cityAndWeather in
                    downloadGroup.enter()
                    NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
                        downloadGroup.enter()
                        switch resultCityNameAndWeather {
                        case let .success(cityNameAndWeather):
                            self?.weathersArray.append(cityNameAndWeather)
                            self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
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
            
            NetworkServiceLoadFunc().loadFunc(city: city) { [weak self] resultCityNameAndWeather in
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
