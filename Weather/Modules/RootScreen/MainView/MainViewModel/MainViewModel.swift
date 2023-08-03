//
//import Foundation
//
//
//protocol MainViewModelProtocol: ViewModelProtocol {
//    var otStateDidChange: ((MainViewModel.State) -> Void)? { get set }
//    func updateState(viewInput: MainViewModel.ViewInput)
//}
//
//class MainViewModel: MainViewModelProtocol {
//    enum State {
//        case initial
//        case firstLaunchDoNotUseLocation // первый пуск без допуска к локации
//        case firstLaunchUseLocation // первый пуск с допуском к локации
//        case subsequentLaunch // (subsequent) загрузка из хранилища
//        case selectCity // выбор города в алерте
//        case loadWeather // загрузка по локации или по выбору в алерте города ||(subsequent) фоном загрузка погоды
//        case loadedWeather //  ||(subsequent)  обновление погоды на Юай
//        case loadedWeatherAndSaveInCoreDate // ||(subsequent)  добавление обновленной погоды в хранилище
//        case error(Error)
//    }
//    
//    enum ViewInput {
//        case buttonAllDay24Hour
//        case buttonSummaryOfTheDay // подгрузить день погоды
//    }
//    
////    coordinator.
//    var otStateDidChange: ((State) -> Void)?
//    
//    private(set) var state: State = .initial {
//        didSet {
//            otStateDidChange?(state)
//        }
//    }
//    
//    func updateState(viewInput: ViewInput) {
//        switch viewInput {
//        case .buttonAllDay24Hour:
//            print("buttonAllDay24Hour")
//            //coordinator push buttonAllDay24Hour
//        case .buttonSummaryOfTheDay:
//            print("buttonSummaryOfTheDay")
//            //coordinator push buttonSummaryOfTheDay
//        }
//    }
//}
