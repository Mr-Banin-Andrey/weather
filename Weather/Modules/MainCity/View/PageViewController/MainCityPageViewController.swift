
import UIKit

protocol MainCityPageDelegate: AnyObject {
    func pageControlCurrentIndex(index: Array<MainCityViewController>.Index)
}

class MainCityPageViewController: UIPageViewController {
        
    var cities = [CardOfTheDayModel]()
    
    var currentIndex: Array<MainCityViewController>.Index = 1
    
    weak var delegateMain: MainCityPageDelegate?
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

//        guard let pageController = pageController else { return }

        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = self.arrayCityViewController.firstIndex(of: viewControllers[0] as! MainCityViewController) else { return }

        print("🍒 currentIndex", currentIndex)
        print("-------------")
        self.delegateMain?.pageControlCurrentIndex(index: currentIndex)

//        pageControl.currentPage = currentIndex

    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return cities.count
//    }
//
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
}
