

import UIKit

class MainCityViewController: UIViewController {
    
    private lazy var manCityView = MainCityView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = manCityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .cyan
        
        manCityView.navigationController(navItem: navigationItem) //navTitle: "то что передам из апи погода")
    }


}

extension MainCityViewController: MainCityViewDelegate {
    
    func showSettingsView() {
        print("showSettingsView")
    }
    
    func showPermissionToUseLocationView() {
        print("showPermissionToUseLocationView")
    }
    
    
}
