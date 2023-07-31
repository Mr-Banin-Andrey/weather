
import Foundation

protocol ViewModelProtocol: AnyObject {}


protocol MainCityViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((MainCityViewModel.State) -> Void)? { get set }
    func updateState(viewInput: MainCityViewModel.ViewInput)
}

class MainCityViewModel: MainCityViewModelProtocol {
    enum State {
        //загрузка погоды (в момент первого пуска показать данные по умолчанию)
        case firstLaunchDoNotUseLocation // первый пуск без допуска к локации
        case firstLaunchUseLocation // первый пуск с допуском к локации
        case subsequentLaunch // (subsequent) загрузка из хранилища
        case loadWeather // загрузка по локации или по выбору в алерте города ||(subsequent) фоном загрузка погоды
        case loadedWeather //  ||(subsequent)  обновление погоды на Юай
        case loadedWeatherAndSaveInCoreDate // ||(subsequent)  добавление обновленной погоды в хранилище

        case error(Error)
    }
    
    enum ViewInput {
        case buttonSettings
        case buttonAlertSelectCity
        case buttonAllDay24Hour
        case buttonSummaryOfTheDay // подгрузить день погоды
    }
    
    // coordinator
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .firstLaunchDoNotUseLocation {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    func updateState(viewInput: MainCityViewModel.ViewInput) {
        switch viewInput {
        case .buttonSettings:
            print("buttonSettings")
        case .buttonAlertSelectCity:
            print("buttonAlertSelectCity")
        case .buttonAllDay24Hour:
            print("buttonAllDay24Hour")
        case .buttonSummaryOfTheDay:
            print("buttonSummaryOfTheDay")
            
        }
    }
}
