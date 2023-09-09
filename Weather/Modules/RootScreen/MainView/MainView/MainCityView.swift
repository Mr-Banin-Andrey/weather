
import Foundation
import UIKit
import SnapKit


protocol MainCityViewDelegate: AnyObject { }

class MainCityView: UIView {
    
    private weak var delegate: MainCityViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()

    init(delegate: MainCityViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func reloadTableView() {
        self.tableView.reloadData()
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
    
}

