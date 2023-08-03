
import UIKit

class AppFactory {
    
//    private let networkService: NetworkServiceWeatherProtocol
//
//    init(networkService: NetworkServiceWeatherProtocol) {
//        self.networkService = networkService
//    }
    
    func makeModule() -> Module {
        let viewModel = RootViewModel() //networkService: networkService
        let view = UINavigationController(rootViewController: RootViewController(viewModel: viewModel))
        return Module(viewModel: viewModel, view: view)
    }
}
