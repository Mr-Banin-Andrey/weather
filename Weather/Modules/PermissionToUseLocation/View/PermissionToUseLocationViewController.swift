

import Foundation
import UIKit
import CoreLocation

class PermissionToUseLocationViewController: UIViewController {
    
//    private let viewModel: PermissionToUseLocationViewModelProtocol
    
    private lazy var permissionToUseLocationView = PermissionToUseLocationView(delegate: self)
 
    private lazy var locationManager = CLLocationManager()
    
    var coordinator: RootCoordinator?
    
//    init(viewModel: PermissionToUseLocationViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
    override func loadView() {
        super.loadView()
        
        view = permissionToUseLocationView
        
        self.permissionToUseLocationView.setupText(text: TextTitle().textTitle[0])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
        
//    func bindViewModel() {
//        viewModel.onStateDidChange = { [weak self] state in
//            guard let self = self else {
//                return
//            }
//            switch state {
//            case.initial:
//                print("initial")
//            case.firstLaunchUseLocation:
//                print("firstLaunchUseLocation")
//            case.firstLaunchDoNotUseLocation:
//                print("firstLaunchDoNotUseLocation")
//            case.subsequentLaunch:
//                print("subsequentLaunch")
//            }
//        }
//    }
}

extension PermissionToUseLocationViewController: PermissionToUseLocationDelegate {
    
    func giveAccessToTheLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        UserDefaults.standard.set("Yes", forKey: "acceptedTerms")
//        coordinator?.push()
        print("🍋 give")
    }
    
    func doNotGiveAccessToTheLocation() {
//        viewModel.updateState(viewInput: .refuseButton)
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        UserDefaults.standard.set("Yes", forKey: "acceptedTerms")
//        coordinator?.push()
        print("do not give ❌")
    }
}

extension PermissionToUseLocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first?.coordinate else { return }
        print("userLocation", userLocation)
        let lat = userLocation.latitude
        let lon = userLocation.longitude
        print(lat, lon)
//        viewModel.updateState(viewInput: .agreeButton(lat: lat, lon: lon))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {

        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            print("У пользователя спросили разрешения использовать геолокацию")

        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
            print("Пользователь разрешил использовать геолокацию")

        case .denied, .restricted:
            print("Попросить пользователя зайти в настройки")
        @unknown default:
            fatalError("Не обрабатываемый статус")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: ", error)
    }
}

