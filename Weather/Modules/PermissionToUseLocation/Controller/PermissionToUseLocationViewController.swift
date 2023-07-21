

import Foundation
import UIKit
import CoreLocation

class PermissionToUseLocationViewController: UIViewController {
    
    var coordinator: PermissionToUseLocationCoordinator?
    
    private lazy var permissionToUseLocationView = PermissionToUseLocationView(delegate: self)
 
    private lazy var locationManager = CLLocationManager()
    
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
        
        print("🍋 give")
    }
    
    func doNotGiveAccessToTheLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        
        print("do not give ❌")
    }
}

extension PermissionToUseLocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first?.coordinate else { return }
        print("userLocation", userLocation)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {

        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            print("У пользователя спросили разрешения использовать геолокацию")

        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
//            manager.desiredAccuracy = 2000.0
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

