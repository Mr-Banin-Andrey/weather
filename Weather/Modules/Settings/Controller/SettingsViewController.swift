
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    

}

extension SettingsViewController: SettingsViewDelegate {
    func selectedTemp() {
        print("selectedTemp")
    }
    
    func selectedSpeedWind() {
        print("selectedSpeedWind")
    }
    
    func selectedTimeFormat() {
        print("selectedTimeFormat")
    }
    
    func selectedNotifications() {
        print("selectedNotifications")
    }
    
    func installSettings() {
        print("installSettings")
        self.navigationController?.popViewController(animated: true)
    }
}
