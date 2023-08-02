
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
//            coordinator?.pushBookViewController()
//            let settings = SettingsViewController()
//            navigationController?.pushViewController(settings, animated: true)
        case let .addCity(city):
            print(city)
//            state = .loadWeather
//             - loadWeather
        case  .buttonAlertSelectCity:
            state = .selectCity
        }
    }
}
