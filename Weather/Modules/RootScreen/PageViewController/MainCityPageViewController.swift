
import UIKit

protocol MainCityPageViewControllerDelegate: AnyObject {
    func didUpdatePageCount(_ mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int)
    func didUpdatePageIndex(_ mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int)
}

class MainCityPageViewController: UIPageViewController {
    
    var cityNameAndWeather: [CityNameAndWeatherModel] = []
        
    weak var delegateMain: MainCityPageViewControllerDelegate?
    
    lazy var arrayCityViewController: [MainCityViewController] = {
        var citiesVC = [MainCityViewController]()
        for city in cityNameAndWeather {
                citiesVC.append(MainCityViewController(
                    weather: city
                ))
            }
        return citiesVC
    }()
    
    init(
        transitionStyle style: UIPageViewController.TransitionStyle = .scroll,
        navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
        options: [UIPageViewController.OptionsKey : Any]? = nil,
        delegateM: MainCityPageViewControllerDelegate,
        cityNameAndWeather: [CityNameAndWeatherModel]
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)

        self.dataSource = self
        self.delegate = self
        self.delegateMain = delegateM
        self.cityNameAndWeather = cityNameAndWeather
        
        if let initialVc = arrayCityViewController.first {
            setViewControllerToBeDisplayed(viewController: initialVc)
        }
        
        delegateMain?.didUpdatePageCount(self, didUpdatePageCount: self.cityNameAndWeather.count)
        
        if self.cityNameAndWeather.isEmpty {
            self.view.backgroundColor = .clear
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updatePageViewController(_ weatherCity: [CityNameAndWeatherModel]) {
        
        self.cityNameAndWeather.removeAll()
        self.arrayCityViewController.removeAll()
        
        weatherCity.forEach { city in
            arrayCityViewController.append(MainCityViewController(weather: city))
            cityNameAndWeather.append(city)
        }

        if let initialVc = arrayCityViewController.first {
            setViewControllerToBeDisplayed(viewController: initialVc)
        }
        
        delegateMain?.didUpdatePageIndex(self, didUpdatePageIndex: 0)
        delegateMain?.didUpdatePageCount(self, didUpdatePageCount: cityNameAndWeather.count)
    }
    
    private func setViewControllerToBeDisplayed(
        viewController: UIViewController,
        direction: UIPageViewController.NavigationDirection = .forward
    ) {
        setViewControllers(
            [viewController],
            direction: direction,
            animated: true,
            completion: { (finished) -> Void in
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
            if index < cityNameAndWeather.count - 1 {
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
