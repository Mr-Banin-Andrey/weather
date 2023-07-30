
import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
    
    var mainCityPageViewController: MainCityPageViewController? {
        didSet {
            mainCityPageViewController?.delegateMain = self
        }
    }
    
    
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
        pageControl.addTarget(self, action: #selector(didChangePageControl), for: .valueChanged)
        return pageControl
    }()
    
    private lazy var viewCity = MainCityPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.setupNavigationController(navigationItem: navigationItem, navigationController: navigationController ?? UINavigationController())
        self.setupUi()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(editIndex(notification:)), name: Notification.Name.init("editIndex"), object: nil)
        
        mainCityPageViewController?.tapAction = { [weak self] index in
            print("index", index)
            self?.pageControl.currentPage = index
        }
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: Notification.Name.init("editIndex"), object: nil)
//        print("notification remove")
//    }
    
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
        self.view.addSubview(self.viewCity.view)
        self.viewCity.didMove(toParent: self)
        self.view.addSubview(self.pageControl)
        
        self.pageControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        self.viewCity.view.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(25)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    @objc private func didChangePageControl() {
        
//        mainCityPageViewController?.scrollToViewController(index: pageControl.currentPage)
        viewCity.scrollToViewController(index: pageControl.currentPage)
//        print("didChangePageControl", pageControl.currentPage)
    }
    
//    @objc private func editIndex(notification: Notification) {
//        guard let dictIndex = notification.userInfo as? [String: Int] else { return }
//
//        let index = dictIndex["index"] ?? 0
//        pageControl.currentPage = index
//    }
    
    @objc private func showSettings() {
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
    }
    
    @objc private func showPermissionToUseLocation() {
//        let permissionToUseLocation = PermissionToUseLocationViewController()
//        navigationController?.pushViewController(permissionToUseLocation, animated: true)
    }
}

extension RootViewController: MainCityPageViewControllerDelegate {
    
//    func didUpdatePageCount(mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int) {
//
//        pageControl.numberOfPages = count
//        print("RootViewController count", count)
//    }
//    
//    func didUpdatePageIndex(mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
//        pageControl.currentPage = index
//        print("RootViewController index", index)
//        
//    }
    
}

