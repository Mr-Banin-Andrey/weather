
import UIKit

protocol MainCityPageViewControllerDelegate: AnyObject {
    func didUpdatePageCount(_ mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int)
    func didUpdatePageIndex(_ mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int)
}

class MainCityPageViewController: UIPageViewController {
    
//    var tapAction: ((_ index: Int) -> Void)?
    
    var cities: [CardOfTheDayModel] = []
        
    weak var delegateMain: MainCityPageViewControllerDelegate?
    
    lazy var arrayCityViewController: [MainCityViewController] = {
        var citiesVC = [MainCityViewController]()
            for city in cities {
                citiesVC.append(MainCityViewController(
//                    viewModel: MainViewModel(),
                    cardOfTheDayModel: city
                ))
            }
        return citiesVC
    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if cities.isEmpty {
////            delegateMain.
//        }
//    }
    
    init(
        transitionStyle style: UIPageViewController.TransitionStyle = .scroll,
        navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
        options: [UIPageViewController.OptionsKey : Any]? = nil,
        delegateM: MainCityPageViewControllerDelegate,
        cities: [CardOfTheDayModel]
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)

        self.view.backgroundColor = .cyan
        self.dataSource = self
        self.delegate = self
        self.delegateMain = delegateM
        self.cities = cities

        if let initialVc = arrayCityViewController.first {
            setViewControllerToBeDisplayed(viewController: initialVc)
        }
        
        delegateMain?.didUpdatePageCount(self, didUpdatePageCount: cities.count)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewControllerToBeDisplayed(
        viewController: UIViewController,
        direction: UIPageViewController.NavigationDirection = .forward
    ) {
        setViewControllers([viewController], direction: direction, animated: true,
                           completion: { (finished) -> Void in
            self.notifyPageControlOfNewIndex()
        } )
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
//            print("notifyPageControlOfNewIndex", index)
            delegateMain?.didUpdatePageIndex(self, didUpdatePageIndex: index)
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
        notifyPageControlOfNewIndex()
    }
}
