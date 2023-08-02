
import UIKit


class AppCoordinator: Coordinatable {
    private(set) var childCoordinators: [Coordinatable] = []
    
    private let factory: AppFactory
    
    init(factory: AppFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let rootCoordinator = RootCoordinator(factory: factory)
        
        let rootStart = rootCoordinator.start()
        
        addChildCoordinator(rootCoordinator)
        return rootStart
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
