
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
    
}
