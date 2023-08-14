
import UIKit


class AppCoordinator: Coordinatable {
    private(set) var childCoordinators: [Coordinatable] = []
        
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let rootCoordinator = RootCoordinator(navigationController: navigationController)
        
        rootCoordinator.start()
        
        addChildCoordinator(rootCoordinator)
    }
    
    func addChildCoordinator(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinatable) {
        childCoordinators = childCoordinators.filter { $0 === coordinator }
    }
}
