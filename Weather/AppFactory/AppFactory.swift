
import UIKit

class AppFactory {
    
    func makeModule() -> Module {
        let viewModel = RootViewModel() //networkService: networkService
        let view = UINavigationController(rootViewController: RootViewController(viewModel: viewModel))
        return Module(viewModel: viewModel, view: view)
    }
}
