
import Foundation
import UIKit
import SnapKit

class SummaryOfTheDayViewController: UIViewController {
    
    private lazy var summaryOfTheDayView = SummaryOfTheDayView(delegate: self)
        
    private var nameCity: String
    private var forecast: Forecasts
    private var weather: NetworkServiceWeatherModel
        
    init(
        nameCity: String,
        forecast: Forecasts,
        weather: NetworkServiceWeatherModel
    ) {
        self.nameCity = nameCity
        self.forecast = forecast
        self.weather = weather
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = summaryOfTheDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.summaryOfTheDayView.navigationController(navItem: navigationItem)
        self.summaryOfTheDayView.configureTableView(delegateTable: self, dataSourceTable: self)
        self.summaryOfTheDayView.setupTitle(text: nameCity)
        
    }
    
    private func loadAnotherDay(forecast: Forecasts) {
        self.forecast = forecast
        self.summaryOfTheDayView.reloadTableView()
    }
}

extension SummaryOfTheDayViewController: SummaryOfTheDayViewDelegate {
    func comeBack() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension SummaryOfTheDayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 1
        }
        if section == 1 {
            return 4
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: "dayCollectionViewId", for: indexPath) as? SummaryOfTheDayCollectionView
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
            
            cell.tapAction = { [unowned self] forecast in
                self.loadAnotherDay(forecast: forecast)
            }
            
            cell.addForecast(forecast: forecast, weather: weather)
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 1 {
            
            if indexPath.row < 2 {
                guard
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dayAndNightWeatherId", for: indexPath) as? DayAndNightWeatherTableViewCell
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                    return cell
                }
                if indexPath.row == 0 {
                    cell.day(forecast: forecast)
                }
                if indexPath.row == 1 {
                    cell.night(forecast: forecast)
                }
                
                cell.selectionStyle = .none
                return cell
            }
            
            if indexPath.row == 2 {
                guard
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sunAndMoonId", for: indexPath) as? SunAndMoonTableViewCell
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                    return cell
                }
                
                cell.setup(forecast: forecast)
                cell.selectionStyle = .none
                return cell
            }
            
            if indexPath.row == 3 {
                guard
                    let cell = tableView.dequeueReusableCell(withIdentifier: "airQualityId", for: indexPath) as? AirQualityTableViewCell
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                    return cell
                }
                cell.selectionStyle = .none
                return cell
            }
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
}
