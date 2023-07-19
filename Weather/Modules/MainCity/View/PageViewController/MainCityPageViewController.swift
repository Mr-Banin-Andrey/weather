

import UIKit

class MainCityPageViewController: UIPageViewController {
    
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
    
    var cities = [CardOfTheDayModel]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = CardDay().cardDay
    }
    
    
    lazy var arrayCityViewController: [MainCityViewController] = {
        var citiesVC = [MainCityViewController]()
            for city in cities {
                citiesVC.append(MainCityViewController(cardOfTheDayModel: city))
            }
        return citiesVC
    }()
    
    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey : Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        
        self.view.backgroundColor = .cyan
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([arrayCityViewController[0]], direction: .forward, animated: true)
        navigationController(navItem: navigationItem, navTitle: "Питер")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigationController(navItem: UINavigationItem, navTitle: String) {
        
        titleLabel.text = navTitle
        navItem.titleView = titleLabel
        
        let barCustomRightButtom = UIBarButtonItem(customView: rightButton)
        navItem.rightBarButtonItems = [barCustomRightButtom]
        navItem.rightBarButtonItem = barCustomRightButtom

        let barCustomLeftButtom = UIBarButtonItem(customView: leftButton)
        navItem.leftBarButtonItems = [barCustomLeftButtom]
        navItem.leftBarButtonItem = barCustomLeftButtom
    }
    
    @objc private func showSettings() {
        print("showSettings")
//        delegate?.showSettingsView()
    }
    
    @objc private func showPermissionToUseLocation() {
        print("showPermissionToUseLocation")
//        delegate?.showPermissionToUseLocationView()
    }
}

extension MainCityPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewController = viewController as? MainCityViewController else { return nil }
        if let index = arrayCityViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayCityViewController[index - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? MainCityViewController else { return nil }
        if let index = arrayCityViewController.firstIndex(of: viewController) {
            if index < cities.count - 1 {
                return arrayCityViewController[index + 1]
            }
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cities.count
    }

    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
