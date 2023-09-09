

import UIKit

class MainCityViewController: UIViewController {
    
    private lazy var manCityView = MainCityView(delegate: self)
    
    var weather: CityNameAndWeatherModel
    
    init(
        weather: CityNameAndWeatherModel
    ) {
        self.weather = weather
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

        self.view.backgroundColor = .systemBackground
        self.manCityView.configureTableView(delegateTable: self, dataSourceTable: self)
                
        NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: nil) { notification in
            self.manCityView.reloadTableView()
        }
    }
    
    
    // targets headers
    @objc private func showAllDay() {
        let allDay = AllDay24HourViewController(weather: weather)
        allDay.addWeatherInArray(weather: weather.weather)
        navigationController?.pushViewController(allDay, animated: true)
    }
    
    @objc private func showTwentyFiveDays() {
        print("showTwentyFiveDays")
    }
}

extension MainCityViewController: MainCityViewDelegate {

}

extension MainCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return 6
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
            header.setupValue(weather: weather.weather)
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
            
            NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: nil) { notification in
                cell.reloadCollectionView()
            }
            
            cell.addWeatherInArray(weather: weather.weather)
            cell.backgroundColor = .systemBackground
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyForecastCell", for: indexPath) as? DailyForecastCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
            
            cell.setupCell(for: weather.weather, index: indexPath.row + 1)
            cell.backgroundColor = .systemBackground
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            if tableView.cellForRow(at: indexPath) is DailyForecastCell {
                let summaryOfTheDay = SummaryOfTheDayViewController(
                    nameCity: weather.nameCity,
                    forecast: weather.weather.forecasts[indexPath.row+1],
                    weather: weather.weather
                )
                self.navigationController?.pushViewController(summaryOfTheDay, animated: true)
            }
        }
    }
}
