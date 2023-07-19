

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
        let mainCityVc = MainCityPageViewController() //MainCityViewController(cardOfTheDayModel: <#CardOfTheDayModel#>)
        navigationController.pushViewController(mainCityVc, animated: true)
    }
    
//    func showSettings() {
//        
//    }
}
