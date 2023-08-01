
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
        case error(Error)
    }
    
    enum ViewInput {
        case buttonSettings
        case buttonAlertSelectCity
    }
    
    // coordinator
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
            
        case .buttonAlertSelectCity:
            print("buttonAlertSelectCity")
        }
    }
}
