
import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
        
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "бургер"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 34).isActive = true
        button.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "месторасположение"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(showPermissionToUseLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .black
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "circle.fill")
        pageControl.currentPage = 0
        pageControl.numberOfPages = CardDay().cardDay.count
        return pageControl
    }()
    
    private lazy var viewCity = MainCityPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.setupNavigationController(navigationItem: navigationItem, navigationController: navigationController ?? UINavigationController())
        self.setupUi()
//        pageControl.currentPage = viewCity.currentIndex
//        view.bringSubviewToFront(pageControl)
    }
    
    func setupNavigationController(navigationItem: UINavigationItem, navigationController: UINavigationController) {
        
        navigationItem.titleView = titleLabel
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        let barCustomRightButtom = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItems = [barCustomRightButtom]
        navigationItem.rightBarButtonItem = barCustomRightButtom

        let barCustomLeftButtom = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItems = [barCustomLeftButtom]
        navigationItem.leftBarButtonItem = barCustomLeftButtom
    }
    
    private func setupUi() {
        self.addChild(viewCity)
        self.view.addSubview(self.pageControl)
        self.view.addSubview(self.viewCity.view)
        
        self.pageControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        self.viewCity.view.snp.makeConstraints { make in
            make.top.equalTo(self.pageControl.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    @objc private func showSettings() {
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
    }
    
    @objc private func showPermissionToUseLocation() {
        let permissionToUseLocation = PermissionToUseLocationViewController()
        navigationController?.pushViewController(permissionToUseLocation, animated: true)
    }
}

extension RootViewController: MainCityPageDelegate {
    func pageControlCurrentIndex(index: Array<MainCityViewController>.Index) {
        pageControl.currentPage = index
    }
}

