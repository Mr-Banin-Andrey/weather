
import Foundation
import UIKit
import SnapKit

protocol WholeDay24hourViewDelegate: AnyObject {
    
}

class WholeDay24hourView: UIView {
    
    weak var delegate: WholeDay24hourViewDelegate?
    
    private lazy var customViewBack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = #colorLiteral(red: 0.6681012511, green: 0.6539016962, blue: 0.6535986066, alpha: 1)
        label.text = "Прогноз на 24 часа"
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kharkiv,Ukraine"
        label.font = UIFont(name: "Rubik-Light_Medium", size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
//        tableView.backgroundColor = .cyan
//        tableView.separatorStyle = .none
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(named: "figmaColorBlue")
        return tableView
    }()
    
    init(delegate: WholeDay24hourViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        self.safeAreaLayoutGuide.owningView?.backgroundColor = .cyan
        
        self.customViewBarItem()
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigationController(navItem: UINavigationItem) {
        let barCustomLeftButtom = UIBarButtonItem(customView: customViewBack)
        navItem.leftBarButtonItem = barCustomLeftButtom
    }
    
    func configureTableView(
        delegateTable: UITableViewDelegate,
        dataSourceTable: UITableViewDataSource
    ) {
        self.tableView.delegate = delegateTable
        self.tableView.dataSource = dataSourceTable
        self.tableView.register(WholeDay24hourTimetableHeader.self, forHeaderFooterViewReuseIdentifier: "TimetableHeader")
//        self.tableView.register(.self, forCellReuseIdentifier: "")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultId")
    }
    
    private func customViewBarItem() {
        customViewBack.addSubview(self.backButton)
        customViewBack.addSubview(self.backLabel)
        
        self.backButton.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        self.backLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.leading.equalTo(self.backButton.snp.trailing).offset(30)
        }
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
        
    }
}
