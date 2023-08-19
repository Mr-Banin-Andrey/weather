
import UIKit

class RootCoordinator: Coordinatable {
    
    private(set) var childCoordinators: [Coordinatable] = []
    
    private let navigationController: UINavigationController
    

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userDefaults = UserDefaults.standard
        if userDefaults.string(forKey: "acceptedTerms") == "Yes" {
            mainViewStart()
        } else {
            locationStart()
        }
    }
    
    
    func mainViewStart()  {
        let viewModel = RootViewModel()
        let rootVc = RootViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(rootVc, animated: true)
    }
    
    func locationStart() {
        let permissionToUse = PermissionToUseLocationViewController()
        permissionToUse.coordinator = self
        navigationController.pushViewController(permissionToUse, animated: true)
    }
    
    func pushSettingsViewController() {
        let viewControllerToPush = SettingsViewController()
        navigationController.pushViewController(viewControllerToPush, animated: true)
    }
}
