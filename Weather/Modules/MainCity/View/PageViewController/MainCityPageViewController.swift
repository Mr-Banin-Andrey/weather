
import UIKit

protocol MainCityPageViewControllerDelegate: AnyObject {
    
    func didUpdatePageCount(mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int)
    
    func didUpdatePageIndex(mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int)
}

class MainCityPageViewController: UIPageViewController {
        
    var cities = [CardOfTheDayModel]()
        
    weak var delegateMain: MainCityPageViewControllerDelegate?
    
    lazy var arrayCityViewController: [MainCityViewController] = {
        var citiesVC = [MainCityViewController]()
            for city in cities {
                citiesVC.append(MainCityViewController(cardOfTheDayModel: city))
            }
        return citiesVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cities = CardDay().cardDay
    }
    
    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey : Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        
        self.view.backgroundColor = .cyan
        self.dataSource = self
        self.delegate = self

        
        if let initialVc = arrayCityViewController.first {
            setViewControllerToBeDisplayed(viewController: initialVc)
        }
        
//        delegateMain?.didUpdatePageCount(mainCityPageViewController: self, didUpdatePageCount: 2)
//        delegateMain?.didUpdatePageIndex(mainCityPageViewController: self, didUpdatePageIndex: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewControllerToBeDisplayed(
        viewController: UIViewController,
        direction: UIPageViewController.NavigationDirection = .forward
    ) {
        setViewControllers([viewController], direction: direction, animated: true, completion: { (finished) -> Void in
            self.notifyPageControlOfNewIndex()
        })
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
           let currentIndex = arrayCityViewController.firstIndex(of: firstViewController as! MainCityViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = arrayCityViewController[newIndex]
            setViewControllerToBeDisplayed(viewController: nextViewController, direction: direction)
        }
    }
    
    
    private func notifyPageControlOfNewIndex() {
        if let firstViewController = viewControllers?.first,
           let index = arrayCityViewController.firstIndex(of: firstViewController as! MainCityViewController) {
            print("notifyPageControlOfNewIndex", index)
            delegateMain?.didUpdatePageIndex(mainCityPageViewController: self, didUpdatePageIndex: index)
        }
    }
}

extension MainCityPageViewController: UIPageViewControllerDataSource {
    
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
}
    
extension MainCityPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {

        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = arrayCityViewController.firstIndex(of: currentViewController as! MainCityViewController) {
                print("index -", index)
                RootViewController().setupPage(index: index)
//                delegateMain?.didUpdatePageIndex(mainCityPageViewController: self, didUpdatePageIndex: index)
            }
        }
        
//        notifyPageControlOfNewIndex()
        
    }
}
