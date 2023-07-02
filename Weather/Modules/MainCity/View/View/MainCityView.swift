
import Foundation
import UIKit
import SnapKit


protocol MainCityViewDelegate: AnyObject {
    func showSettingsView()
    func showPermissionToUseLocationView()
}

class MainCityView: UIView {
    
    private weak var delegate: MainCityViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .darkGray
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .black
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "circle.fill")
        
        return pageControl
    }()
    
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
    
    func settingsPageControl(scrollDelegate: UIScrollViewDelegate, numberOfPages: Int) {
        self.scrollView.delegate = scrollDelegate
        self.pageControl.numberOfPages = numberOfPages
    }
    
    private func setupUi() {
        self.addSubview(self.scrollView)
        self.addSubview(self.pageControl)
        
        self.scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        self.pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    @objc private func showSettings() {
        delegate?.showSettingsView()
    }
    
    @objc private func showPermissionToUseLocation() {
        delegate?.showPermissionToUseLocationView()
    }
}
