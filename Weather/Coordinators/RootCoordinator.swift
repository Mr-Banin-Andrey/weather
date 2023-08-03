

import UIKit

class RootCoordinator: ModuleCoordinatable {
    
    private let factory: AppFactory
    
    private(set) var childCoordinators: [Coordinatable] = []
    private(set) var module: Module?
    
    init(factory: AppFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let module = factory.makeModule()
        let viewController = module.view
        (module.viewModel as? RootViewModel)?.coordinator = self
        self.module = module
        return viewController
    }
    
    func pushSettingsViewController() {
        let viewControllerToPush = SettingsViewController()
        (module?.view as? UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
    }
    
}
