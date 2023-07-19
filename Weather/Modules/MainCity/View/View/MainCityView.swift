
import Foundation
import UIKit
import SnapKit


protocol MainCityViewDelegate: AnyObject {
    func showSettingsView()
    func showPermissionToUseLocationView()
}

class MainCityView: UIView {
    
    private weak var delegate: MainCityViewDelegate?
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()
    
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
    
    init(delegate: MainCityViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func navigationController(navItem: UINavigationItem, navTitle: String) {
//
//        titleLabel.text = navTitle
//        navItem.titleView = titleLabel
//
//        let barCustomRightButtom = UIBarButtonItem(customView: rightButton)
//        navItem.rightBarButtonItems = [barCustomRightButtom]
//        navItem.rightBarButtonItem = barCustomRightButtom
//
//        let barCustomLeftButtom = UIBarButtonItem(customView: leftButton)
//        navItem.leftBarButtonItems = [barCustomLeftButtom]
//        navItem.leftBarButtonItem = barCustomLeftButtom
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
        self.addSubview(self.tableView)
                
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
//    @objc private func showSettings() {
//        delegate?.showSettingsView()
//    }
//
//    @objc private func showPermissionToUseLocation() {
//        delegate?.showPermissionToUseLocationView()
//    }
}
