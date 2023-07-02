

import UIKit

class PermissionToUseLocationCoordinator: Coordinatable {
    
    var child: [Coordinatable] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showPerToUseLocalVc()
    }
    
    func showPerToUseLocalVc() {
        let perToUseLocalVc = PermissionToUseLocationViewController()
        navigationController.pushViewController(perToUseLocalVc, animated: true)
    }
    
//    func showMainCityVc() {
//        let mainCityVc = MainCityViewController()
//        navigationController.pushViewController(mainCityVc, animated: true)
//    }
}
