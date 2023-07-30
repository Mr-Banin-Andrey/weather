

import UIKit

class MainCityCoordinator: Coordinatable {
    
    var child: [Coordinatable] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainCiryVC()
    }
    
    func showMainCiryVC() {
        let mainCityVc = RootViewController() 
        navigationController.pushViewController(mainCityVc, animated: true)
    }
    
//    func showPerToUseLocalVc() {
//        let perToUseLocalVc = PermissionToUseLocationViewController()
//        navigationController.pushViewController(perToUseLocalVc, animated: true)
//    }
}
