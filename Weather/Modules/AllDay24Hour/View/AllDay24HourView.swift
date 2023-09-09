
import Foundation
import UIKit
import SnapKit

protocol AllDay24HourViewDelegate: AnyObject {
    func comeBack()
}

class AllDay24HourView: UIView {
    
    weak var delegate: AllDay24HourViewDelegate?
        
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(comeBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.text = "   Прогноз на 24 часа"
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kharkiv,Ukraine"
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor =  .systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(delegate: AllDay24HourViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigationController(navItem: UINavigationItem) {
        let barCustomLeftButtom = UIBarButtonItem(customView: backLabel)
        let leftButtonTwo = UIBarButtonItem(customView: backButton)
        
        navItem.leftBarButtonItems = [leftButtonTwo, barCustomLeftButtom]
    }
    
    func setupTitle(text: String) {
        self.titleLabel.text = text
    }
    
    func configureTableView(
        delegateTable: UITableViewDelegate,
        dataSourceTable: UITableViewDataSource
    ) {
        self.tableView.delegate = delegateTable
        self.tableView.dataSource = dataSourceTable
        self.tableView.register(AllDay24HourTimetableHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        self.tableView.register(AllDay24HourTimetableCell.self, forCellReuseIdentifier: "customId")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultId")
    }
    
    private func setupUi() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
        
        self.titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(15)
            make.leading.equalTo(self.snp.leading).inset(50)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    @objc private func comeBack() {
        print("comeBack")
        delegate?.comeBack()
    }
}
