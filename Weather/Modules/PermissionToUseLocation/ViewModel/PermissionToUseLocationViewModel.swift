//
//import Foundation
//import CoreLocation
//
//protocol PermissionToUseLocationViewModelProtocol: ViewModelProtocol {
//    var onStateDidChange: ((PermissionToUseLocationViewModel.State) -> Void)? { get set }
//    func updateState(viewInput: PermissionToUseLocationViewModel.ViewInput)
//}
//
//class PermissionToUseLocationViewModel: PermissionToUseLocationViewModelProtocol {
//    enum State {
//        case initial
//        case firstLaunchDoNotUseLocation // первый пуск без допуска к локации
//        case firstLaunchUseLocation // первый пуск с допуском к локации
//        case subsequentLaunch
//    }
//    
//    enum ViewInput {
//        case agreeButton(lat: Double, lon: Double)
//        case refuseButton
//    }
//    
////    private lazy var locationManager = CLLocationManager()
//    
//    weak var coordinator: RootCoordinator?
//    var onStateDidChange: ((State) -> Void)?
//    
//    private(set) var state: State = .initial {
//        didSet {
//            onStateDidChange?(state)
//        }
//    }
//    
//    func updateState(viewInput: ViewInput) {
//        switch viewInput {
//        case let .agreeButton(lat, lon):
//            coordinator?.mainViewStart()
//            print("case let .agreeButton(lat, lon):")
//        case.refuseButton:
//        
//            print("")
//        }
//    }
//}

//extension PermissionToUseLocationViewModel: CLLocationManagerDelegate, NSObjectProtocol {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let userLocation = locations.first?.coordinate else { return }
//        print("userLocation", userLocation)
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//
//        case .notDetermined:
//            manager.requestWhenInUseAuthorization()
//            print("У пользователя спросили разрешения использовать геолокацию")
//
//        case .authorizedAlways, .authorizedWhenInUse:
//            manager.requestLocation()
////            manager.desiredAccuracy = 2000.0
//            print("Пользователь разрешил использовать геолокацию")
//
//        case .denied, .restricted:
//            print("Попросить пользователя зайти в настройки")
//        @unknown default:
//            fatalError("Не обрабатываемый статус")
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("didFailWithError: ", error)
//    }
//}
