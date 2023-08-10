

import UIKit

class RootCoordinator: ModuleCoordinatable {
    
    private let factory: AppFactory
    
    private(set) var childCoordinators: [Coordinatable] = []
    private(set) var module: Module?
    
    private let navigationController = UINavigationController()
    
    init(factory: AppFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
//        let acceptedTerms = UserDefaults.standard.string(forKey: "acceptedTerms")
//        if acceptedTerms != nil && acceptedTerms == "Yes" {
            return mainViewStart()
//        } else {
//            return permToUse()
//        }
    }
    
    func mainViewStart() -> UIViewController {
        let module = factory.makeModule()
        let viewController = module.view
        (module.viewModel as? RootViewModel)?.coordinator = self
        self.module = module
        return viewController
    }
    
    func locationStart() -> UIViewController {
        return PermissionToUseLocationViewController()
    }
    
    func pushSettingsViewController() {
        let viewControllerToPush = SettingsViewController()
        (module?.view as? UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
    }
}
