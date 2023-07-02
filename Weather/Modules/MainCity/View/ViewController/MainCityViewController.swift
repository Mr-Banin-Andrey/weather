

import UIKit

class MainCityViewController: UIViewController {
    
    private lazy var manCityView = MainCityView(delegate: self)
    
    override func loadView() {
        super.loadView()
        
        view = manCityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        
        manCityView.navigationController(navItem: navigationItem, navTitle: "то что передам из апи погода")
        
        manCityView.settingsPageControl(scrollDelegate: self, numberOfPages: 2)
    }


}

extension MainCityViewController: MainCityViewDelegate {
    
    func showSettingsView() {
        print("showSettingsView")
    }
    
    func showPermissionToUseLocationView() {
        print("showPermissionToUseLocationView")
    }
    
    
}

extension MainCityViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        manCityView.pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        print(" currentPage", Int(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        print(" scrollView", scrollView.contentOffset.x)
        print(" UIScreen", UIScreen.main.bounds.width)
    }
}
