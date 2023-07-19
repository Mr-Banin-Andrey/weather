

import UIKit

class MainCityViewController: UIViewController {
    
    private lazy var manCityView = MainCityView(delegate: self)    
    
    private var cardOfTheDayModel: CardOfTheDayModel
    
    init(cardOfTheDayModel: CardOfTheDayModel) {
        self.cardOfTheDayModel = cardOfTheDayModel
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = manCityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        
//        manCityView.navigationController(navItem: navigationItem, navTitle: "то что передам 7°/13° ")
        manCityView.configureTableView(delegateTable: self, dataSourceTable: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc private func showAllDay() {
        let allDay = AllDay24HourViewController()
        navigationController?.pushViewController(allDay, animated: true)
    }
    
    @objc private func showTwentyFiveDays() {
        print("showTwentyFiveDays")
    }
}

extension MainCityViewController: MainCityViewDelegate {
    
    func showSettingsView() {
        print("showSettingsView")
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
    }
    
    func showPermissionToUseLocationView() {
        print("showPermissionToUseLocationView")
        let permissionToUseLocation = PermissionToUseLocationViewController()
        navigationController?.pushViewController(permissionToUseLocation, animated: true)
    }
}

extension MainCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return 7
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardOfTheDayId") as? CardOfTheDayHeader
            else { return nil }
            
            header.detailedWeatherForTheDayButton.addTarget(self, action: #selector(showAllDay), for: .touchUpInside)
            header.setupValue(weather: cardOfTheDayModel)
            return header
        }

        if section == 1 {
            guard
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TwentyFiveDaysLabelHeader") as? TwentyFiveDaysLabelHeader
            else { return nil }
            
            header.twentyFiveDaysButton.addTarget(self, action: #selector(showTwentyFiveDays), for: .touchUpInside)
            return header
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell", for: indexPath) as? HourlyWeatherCollectionViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                
                return cell
            }
            
            cell.backgroundColor = .systemBackground
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyForecastCell", for: indexPath) as? DailyForecastCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                
                return cell
            }
            
            cell.backgroundColor = .systemBackground
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let summaryOfTheDay = SummaryOfTheDayViewController()
            self.navigationController?.pushViewController(summaryOfTheDay, animated: true)
        }
    }
    
}
