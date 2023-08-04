
import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
        
    private let viewModel: RootViewModelProtocol
    
    private lazy var rootView = RootView(delegate: self)
    
    private var weather: [NetworkServiceWeatherModel] = []
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .black
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "circle.fill")
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(didChangePageControl), for: .valueChanged)
        return pageControl
    }()
        
    private lazy var mainCityPageViewController = MainCityPageViewController(
        delegateM: self,
        cities: weather
    )
    
    init(viewModel: RootViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.rootView.setupNavigationController(
            navigationItem: navigationItem,
            navigationController: navigationController ?? UINavigationController()
        )
        
        self.setupUi()
        self.bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "Поиск города",
            message: nil,
            preferredStyle: .alert
        )
        let createAction =  UIAlertAction(
            title: "Добавить",
            style: .default
        ) { _ in
            let city = alert.textFields?.first?.text ?? ""
            self.viewModel.updateState(viewInput: .addCity(city: city))
        }
        self.rootView.alert(vc: self, alert: alert, createAction: createAction)
    }
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else {
                return
            }
            
            switch state {
            case .initial:
                print("initial")
            
            case .selectCity:
                self.showAlert()
            
            case .loadWeather:
                print("loadWeather")
            
            case let .loadedCity(city):
                self.rootView.setupTitle(text: city)
                self.viewWillLayoutSubviews()
            case let .loadedWeather(weather):
                print("loadedWeather")
                // put it in dispatchQueue
                self.weather = weather
                mainCityPageViewController.updatePageViewController(weather)
                
            case .error(_):
                print("error")
        
//            case .firstLaunchDoNotUseLocation:
//                print("firstLaunchDoNotUseLocation")
//            case .firstLaunchUseLocation:
//                print("firstLaunchUseLocation")
////                self.mainCityPageViewController.
//
//            case .loadedWeatherAndSaveInCoreDate:
//                print("loadedWeatherAndSaveInCoreDate")
//            case .subsequentLaunch:
//                print("subsequentLaunch")
            }
        }
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
   
    @objc private func didChangePageControl() {
        self.mainCityPageViewController.scrollToViewController(index: pageControl.currentPage)
    }
}

extension RootViewController: MainCityPageViewControllerDelegate {
    
    func didUpdatePageCount(_ mainCityPageViewController: UIPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
//        print("MainCityPageViewControllerDelegate - count", count)
    }
    
    func didUpdatePageIndex(_ mainCityPageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
//        print("MainCityPageViewControllerDelegate - index", index)
    }
}

extension RootViewController: RootViewProtocol {
    
    func showSettings() {
        viewModel.updateState(viewInput: .buttonSettings)
    }
    
    func showPermissionToUseLocation() {
        viewModel.updateState(viewInput: .buttonAlertSelectCity)
    }
}
