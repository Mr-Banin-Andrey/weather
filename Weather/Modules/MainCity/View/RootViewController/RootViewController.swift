
import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
        
    private let viewModel: MainCityViewModelProtocol
    
    private lazy var rootView = RootView(delegate: self)
    
//    private lazy var leftButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "бургер"), for: .normal)
//        button.tintColor = .black
//        button.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 34).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 18).isActive = true
//        return button
//    }()
//
//    private lazy var rightButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: "месторасположение"), for: .normal)
//        button.tintColor = .black
//        button.addTarget(self, action: #selector(showPermissionToUseLocation), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
//        return button
//    }()
//
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
//        label.textColor = .black
//        return label
//    }()
//
//    private lazy var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.currentPageIndicatorTintColor = .black
//        pageControl.pageIndicatorTintColor = .black
//        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
//        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "circle.fill")
//        pageControl.currentPage = 0
////        pageControl.numberOfPages = 1
//        pageControl.addTarget(self, action: #selector(didChangePageControl), for: .valueChanged)
//        return pageControl
//    }()
        
//    private lazy var mainCityPageViewController = MainCityPageViewController(delegateM: self, cities: CardDay().cardDay)
    
    init(viewModel: MainCityViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.setupNavigationController(navigationItem: navigationItem, navigationController: navigationController ?? UINavigationController())
        self.setupUi()
    }
    
    
    func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else {
                return
            }
            
            switch state {
            case .firstLaunchDoNotUseLocation:
                print("firstLaunchDoNotUseLocation")
            case .firstLaunchUseLocation:
                print("firstLaunchUseLocation")
            case .loadWeather:
                print("loadWeather")
            case .loadedWeather:
                print("loadedWeather")
            case .loadedWeatherAndSaveInCoreDate:
                print("loadedWeatherAndSaveInCoreDate")
            case .subsequentLaunch:
                print("subsequentLaunch")
            case .error(_):
                print("error")
            }
        }
    }
    
    
    private func setupNavigationController(navigationItem: UINavigationItem, navigationController: UINavigationController) {
        
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
        self.addChild(mainCityPageViewController)
        self.view.addSubview(self.mainCityPageViewController.view)
        self.mainCityPageViewController.didMove(toParent: self)
        self.view.addSubview(self.pageControl)
        
        self.pageControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        self.mainCityPageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(25)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
   
}

extension RootViewController: MainCityPageViewControllerDelegate {
    
    func didUpdatePageCount(_ mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
        print("MainCityPageViewControllerDelegate - count", count)
    }
    
    func didUpdatePageIndex(_ mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
        print("MainCityPageViewControllerDelegate - index", index)
    }
    
}

extension RootViewController: RootViewProtocol {
    func didChangePageControl() {
        mainCityPageViewController.scrollToViewController(index: pageControl.currentPage)
    }
    
    func showSettings() {
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
    }
    
    func showPermissionToUseLocation() {
//        let permissionToUseLocation = PermissionToUseLocationViewController()
//        navigationController?.pushViewController(permissionToUseLocation, animated: true)
    }
}
