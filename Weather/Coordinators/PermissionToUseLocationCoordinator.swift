

import UIKit

class PermissionToUseLocationCoordinator: Coordinatable {
    
    var child: [Coordinatable] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
