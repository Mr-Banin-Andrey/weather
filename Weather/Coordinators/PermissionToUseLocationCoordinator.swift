

import UIKit

class PermissionToUseLocationCoordinator: Coordinatable {
    
    var child: [Coordinatable] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showperToUseLocalVc()
    }
    
    func showperToUseLocalVc() {
        let perToUseLocalVc = PermissionToUseLocationViewController()
        navigationController.pushViewController(perToUseLocalVc, animated: true)
    }
}
