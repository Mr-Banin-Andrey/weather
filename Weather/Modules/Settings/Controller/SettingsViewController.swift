
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
        
        let userDefaultsTemp = SettingsUserDefaults().getValue(key: .temperature)
        let userDefaultsTime = SettingsUserDefaults().getValue(key: .timeFormat)
        let userDefaultsSpeed = SettingsUserDefaults().getValue(key: .windSpeed)
        self.settingsView.getIndexSelected(temp: userDefaultsTemp.indexSelected, time: userDefaultsTime.indexSelected, speed: userDefaultsSpeed.indexSelected)
        
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
    
    func selectedSpeedWind(milesOrKilometers: SettingsUserDefaultsModel) {
        SettingsUserDefaults().addValue(key: .windSpeed, value: milesOrKilometers)
        print("")
    }
    
    func selectedTimeFormat(twelveOrTwentyFour: SettingsUserDefaultsModel) {
        SettingsUserDefaults().addValue(key: .timeFormat, value: twelveOrTwentyFour)
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
