
import Foundation
import UIKit
import SnapKit


protocol MainCityViewDelegate: AnyObject {
    func showSettingsView()
    func showPermissionToUseLocationView()
}

class MainCityView: UIView {
    
    private weak var delegate: MainCityViewDelegate?
    
//    private lazy var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .darkGray
//        scrollView.isPagingEnabled = true
//        return scrollView
//    }()
//
//
//    lazy var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.currentPageIndicatorTintColor = .black
//        pageControl.pageIndicatorTintColor = .black
//        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
//        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "circle.fill")
//        return pageControl
//    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
//        tableView.backgroundColor = .cyan
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
//    private lazy var contentView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .green
//        view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
//        return view
//    }()
    
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
        label.font = UIFont(name: "Rubik-Light_Medium", size: 18)
        label.textColor = .black
        return label
    }()
    
    init(delegate: MainCityViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupUi()
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
    
//    func settingsPageControl(
//        scrollDelegate: UIScrollViewDelegate,
////        scrollFrame: CGRect,
//        numberOfPages: Int
//    ) {
//        let widthScreen = UIScreen.main.bounds.width
//        let heightScreen = UIScreen.main.bounds.height
////
//        let numberOfPagesCGFloat:CGFloat = CGFloat(numberOfPages)
////
//        print("🍋 widthScreen", widthScreen)
//        print("🍋count pages (CGFloat)", numberOfPagesCGFloat)
//        print("🍋 widthScreen * abs", widthScreen * numberOfPagesCGFloat)
//        
//        self.scrollView.delegate = scrollDelegate
//        
//        
////        self.scrollView.frame = scrollFrame
//        self.scrollView.contentSize = CGSize(width: widthScreen * numberOfPagesCGFloat, height: heightScreen)
//        self.pageControl.numberOfPages = numberOfPages
//    }
    
    func configureTableView(
        delegateTable: UITableViewDelegate,
        dataSourceTable: UITableViewDataSource

    ) {
        self.tableView.delegate = delegateTable
        self.tableView.dataSource = dataSourceTable
        
        self.tableView.register(CardOfTheDayHeader.self, forHeaderFooterViewReuseIdentifier: "cardOfTheDayId")
        self.tableView.register(HourlyWeatherCollectionViewCell.self, forCellReuseIdentifier: "CollectionViewCell")
        self.tableView.register(TwentyFiveDaysLabelHeader.self, forHeaderFooterViewReuseIdentifier: "TwentyFiveDaysLabelHeader")
        self.tableView.register(DailyForecastCell.self, forCellReuseIdentifier: "DailyForecastCell")
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultId")
    }
    
    private func setupUi() {
        let widthScreen = UIScreen.main.bounds.width
//        let heightScreen = UIScreen.main.bounds.height
        
//        self.contentView.frame.size = CGSize(width: widthScreen, height: heightScreen )
//        self.scrollView.contentSize = CGSize(width: widthScreen, height: heightScreen )
//        self.addSubview(self.pageControl)
//        self.addSubview(self.scrollView)
        self.addSubview(self.tableView)

//        self.scrollView.addSubview( self.tableView)
//        self.contentView.addSubview(self.tableView)
        
        
//        self.pageControl.snp.makeConstraints { make in
//
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
//            make.centerX.equalTo(self.snp.centerX)
//        }
//
//        self.scrollView.snp.makeConstraints { make in
//            make.top.equalTo(self.pageControl.snp.bottom)
////            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
//            make.leading.equalTo(self.snp.leading)
//            make.trailing.equalTo(self.snp.trailing)
//            make.height.equalTo(600)
//        }
//
        
        
//        self.contentView.snp.makeConstraints { make in
//            make.top.equalTo(self.scrollView.snp.top) //
//            make.leading.equalTo(self.scrollView.snp.leading)
//            make.trailing.equalTo(self.scrollView.snp.trailing)
//            make.bottom.equalTo(self.scrollView.snp.bottom)
////            make.width.equalTo(self.scrollView.snp.width)
////            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom) //.offset(500)
//            make.width.equalTo(widthScreen)
//        }
        
        
        self.tableView.snp.makeConstraints { make in

//            make.top.equalTo(self.pageControl.snp.bottom) //
//            make.leading.equalTo(self.scrollView.snp.leading)
//            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
//\
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            
//            make.top.equalTo(self.scrollView.snp.top)
//            make.leading.equalTo(self.scrollView.snp.leading)
//            make.trailing.equalTo(self.scrollView.snp.trailing)
//            make.bottom.equalTo(self.scrollView.snp.bottom)
//            make.width.equalTo(widthScreen)
//            make.center.equalTo(self.scrollView.snp.center)
////            make.trailing.equalTo(self.contentView.snp.trailing)
//            make.bottom.equalTo(self.scrollView.snp.bottom) //.offset(500)
//            make.width.equalTo(widthScreen)
        }
        
    }
    
    @objc private func showSettings() {
        delegate?.showSettingsView()
    }
    
    @objc private func showPermissionToUseLocation() {
        delegate?.showPermissionToUseLocationView()
    }
}
