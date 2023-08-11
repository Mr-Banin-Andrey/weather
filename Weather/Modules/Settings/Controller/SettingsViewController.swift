
import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var settingsView = SettingsView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = SettingsUserDefaults().getValue(key: .temperature)
        self.settingsView.getIndexSelected(temp: userDefaults.indexSelected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    

}

extension SettingsViewController: SettingsViewDelegate {
    func selectedTemp(сelsiusOrFahrenheit: SettingsUserDefaultsModel) {
        SettingsUserDefaults().addValue(key: .temperature, value: сelsiusOrFahrenheit)
        print("")
    }
    
    func selectedSpeedWind(milesOrKilometers: String) {
        print("")
    }
    
    func selectedTimeFormat(twelveOrTwentyFour: String) {
        print("")
    }
    
    func selectedNotifications(onOrOff: String) {
        print("")
    }
    
    func installSettings() {
        print("installSettings")
        self.navigationController?.popViewController(animated: true)
    }
}
