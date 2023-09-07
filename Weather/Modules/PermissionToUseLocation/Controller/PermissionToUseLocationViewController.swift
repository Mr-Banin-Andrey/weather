

import Foundation
import UIKit
import CoreLocation

class PermissionToUseLocationViewController: UIViewController {
    
    var tapAction: ((LocationModel) -> Void)?
        
    private lazy var permissionToUseLocationView = PermissionToUseLocationView(delegate: self)
 
    private lazy var locationManager = CLLocationManager()
    
    weak var coordinator: RootCoordinator?
    
    override func loadView() {
        super.loadView()
        
        view = permissionToUseLocationView
        
        self.permissionToUseLocationView.setupText(text: TextTitle().textTitle[0])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension PermissionToUseLocationViewController: PermissionToUseLocationDelegate {
    
    func giveAccessToTheLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        UserDefaults.standard.set("Yes", forKey: "acceptedTerms")
        coordinator?.start()
        print("🍋 give")
    }
    
    func doNotGiveAccessToTheLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        UserDefaults.standard.set("Yes", forKey: "acceptedTerms")
        coordinator?.start()
        print("do not give ❌")
    }
}

extension PermissionToUseLocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first?.coordinate else { return }
        let lat = userLocation.latitude
        let lon = userLocation.longitude
        print("lat, lon", lat, lon)
//        var array = LocationArray()
//        array.locationArray.append(LocationModel(latitude: lat, longitude: lon))
//        delegateRoot?.getLocation(lat: lat, lon: lon)
//        tapAction?(LocationModel(latitude: lat, longitude: lon))
//        RootViewController().getLocation(lat: lat, lon: lon)
        RootViewModel().updateState(viewInput: .useLocationCity(lat: lat, lon: lon)) //.sendLocation(lat: lat, lon: lon)
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

