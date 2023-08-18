
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
        
        case updateWeather(cityAndWeather: [CityNameAndWeatherModel]) // загрузка сразу всех городов из сети
        
        case loadedWeatherFromCache(cityAndWeather: [CityNameAndWeatherModel]) // загрузка из базы сразу всех городов
        case loadedWeatherFromNetwork(cityAndWeather: CityNameAndWeatherModel) // загрузка по одному городу
        
        case error(Error)
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
    
    var weathersArray = [CityNameAndWeatherModel]()
    
    
    
    //    let updateWeatherQueue = DispatchQueue(label: "ru.weather.updateWeatherQueue", qos: .utility, attributes: [.concurrent])
    
    private lazy var updateWeatherQueue = DispatchQueue(label: "ru.weather.updateWeatherQueue", qos: .userInteractive, attributes: [.concurrent])
    
    private lazy var updateWeatherQueueSerial = DispatchQueue(label: "ru.weather.updateWeatherQueueSerial")
        
        
//    func testRun(array: [CityNameAndWeatherModel], completion: @escaping ([CityNameAndWeatherModel]) -> Void) {
//        var arrayTwo = [CityNameAndWeatherModel]()
//        let clearBase = self.realmService.clearBase()
//        print("🛜clearBase", clearBase)
//
//        array.forEach { cityAndWeather in
//            NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
//                switch resultCityNameAndWeather {
//                case let .success(cityNameAndWeather):
//                    arrayTwo.append(cityNameAndWeather)
//                    self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
//                    print("🛜 testRun arrayTwo.count - ", arrayTwo.count)
//                case let .failure(Error):
//                    print(Error)
//                }
//            }
//        }
//    }

    
    
//    func testRun2() async throws -> [CityNameAndWeatherModel] {
//        var arrayTwo = [CityNameAndWeatherModel]()
//        let clearBase = self.realmService.clearBase()
//        print("🛜clearBase", clearBase)
//        weathersArray.forEach { cityAndWeather in
//            NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
//                switch resultCityNameAndWeather {
//                case let .success(cityNameAndWeather):
//                    arrayTwo.append(cityNameAndWeather)
//                    self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
//                    print("🛜 testRun arrayTwo.count - ", arrayTwo.count)
//                case let .failure(Error):
//                    print(Error)
//                }
//            }
//        }
//
//        return try await withCheckedThrowingContinuation { continuation in
//            testRun2() { result in
//                continuation.resume(returning: result)
//            }
//        }
//    }
    
    func updateState(viewInput: RootViewModel.ViewInput) {
        switch viewInput {
        case .loadCityAndWeather:
            // 1. загрузка из базы
            let cititsAndWeather = self.realmService.fetch()
            print("cititsAndWeather count -", cititsAndWeather.count)
            if !cititsAndWeather.isEmpty {
                // 2. отображение на экране
                self.state = .loadedWeatherFromCache(cityAndWeather: cititsAndWeather)
                
                // 3. обновляю данные погоды
                
                //    // 1
                //    var storedError: NSError?
                    let downloadGroup = DispatchGroup()
                //    for address in [
                //      PhotoURLString.overlyAttachedGirlfriend,
                //      PhotoURLString.successKid,
                //      PhotoURLString.lotsOfFaces
                //    ] {
                //      guard let url = URL(string: address) else { return }
                //      downloadGroup.enter()
                //      let photo = DownloadPhoto(url: url) { _, error in
                //        storedError = error
                //        downloadGroup.leave()
                //      }
                //      PhotoManager.shared.addPhoto(photo)
                //    }
                //
                //    // 2
                //    downloadGroup.notify(queue: DispatchQueue.main) {
                //      completion?(storedError)
                //    }
                downloadGroup.enter()
                cititsAndWeather.forEach { cityAndWeather in
                    NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
                        switch resultCityNameAndWeather {
                        case let .success(cityNameAndWeather):
                            self?.weathersArray.append(cityNameAndWeather)
                            self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
                        case let .failure(Error):
                            print(Error)
                        }
                    }
                    downloadGroup.leave()
                }
                downloadGroup.notify(queue: DispatchQueue.main) {
                      completion?(storedError)
                }
//                updateWeatherQueue.async {
//                    self.testRun(array: cititsAndWeather) { value in
//                        print("value",value)
//                    }
//                    cititsAndWeather.forEach { cityAndWeather in
//                        NetworkServiceLoadFunc().loadFunc(city: cityAndWeather.nameCity) { [weak self] resultCityNameAndWeather in
//                            switch resultCityNameAndWeather {
//                            case let .success(cityNameAndWeather):
//                                self?.weathersArray.append(cityNameAndWeather)
//                                self?.realmService.addCityAndWeather(cityAndWeather: cityNameAndWeather)
//                            case let .failure(Error):
//                                print(Error)
//                            }
//                        }
                    
//                }

//                DispatchQueue.asyncAndWait(<#T##self: DispatchQueue##DispatchQueue#>)
                
//                self.state = .updateWeather(cityAndWeather: self.weathersArray)


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
