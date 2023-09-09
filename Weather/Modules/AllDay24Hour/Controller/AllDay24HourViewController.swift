
import Foundation
import UIKit
import SnapKit


class AllDay24HourViewController: UIViewController {
    
    private lazy var allDay24HourView = AllDay24HourView(delegate: self)
    
    private var hours = [Hours]()
    
    private let weather: CityNameAndWeatherModel
    
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
        
        view = allDay24HourView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allDay24HourView.navigationController(navItem: navigationItem)
        self.allDay24HourView.configureTableView(delegateTable: self, dataSourceTable: self)
        self.allDay24HourView.setupTitle(text: weather.nameCity)
    }
    
    deinit {
        print("deinit AllDay24HourViewController")
    }
    
    func addWeatherInArray(weather: NetworkServiceWeatherModel) {
        if self.hours.isEmpty {
            addHoursInArray(weather: weather)
        } else {
            self.hours.removeAll()
            addHoursInArray(weather: weather)
        }
    }
    
    func addHoursInArray(weather: NetworkServiceWeatherModel) {
        
        self.hours.removeAll()
        
        let weatherTime = Int(DecodingOfDate().codeDate(unixTime: weather.now, dateFormat: .hour, secondsFromGMT: weather.info.tzinfo.offset))
        guard let nowHour = weatherTime else { return }
        
        let array = switchArray(time: nowHour)
        let index = 0
        
        for (i, hour) in array.enumerated() {
            
            if (i == 0) && (hour == 0) && (hours.count < 7) {
                hours.append(weather.forecasts[index].hours[hour])
            }
            
            if (hour != 21) && (hour != 0) && (hours.count < 7) {
                hours.append(weather.forecasts[index].hours[hour])
            }
            
            if hour == 21 {
                hours.append(weather.forecasts[index].hours[hour])
                
                if let indexTwentyOne = array.firstIndex(of: 21) {
                    for (indexTwo, hourTwo) in array.enumerated() {
                        if (indexTwo > indexTwentyOne) && (hourTwo == 0) && (hours.count < 7) {
                            hours.append(weather.forecasts[index+1].hours[hourTwo])
                        }
                        
                        if (indexTwo > indexTwentyOne) && (hourTwo != 0) && (hours.count < 7) {
                            hours.append(weather.forecasts[index+1].hours[hourTwo])
                        }
                    }
                }
            }
        }
    }
    
    private func switchArray(time: Int) -> [Int] {
        switch time {
        case 0...2:
            let array = [0,3,6,9,12,15,18]
            return array
        case 3...5:
            let array = [3,6,9,12,15,18,21]
            return array
        case 6...8:
            let array = [6,9,12,15,18,21,0]
            return array
        case 9...11:
            let array = [9,12,15,18,21,0,3]
            return array
        case 12...14:
            let array = [12,15,18,21,0,3,6]
            return array
        case 15...17:
            let array = [15,18,21,0,3,6,9]
            return array
        case 18...20:
            let array = [18,21,0,3,6,9,12]
            return array
        case 21...23:
            let array = [21,0,3,6,9,12,15]
            return array
        default:
            print("")
        }
        return [Int()]
    }
    
    
}

extension AllDay24HourViewController: AllDay24HourViewDelegate {
    func comeBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AllDay24HourViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 0
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
                let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? AllDay24HourTimetableHeader
            else { return nil }
            
            header.setupHeader(hour: hours, weather: weather.weather)
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customId", for: indexPath) as? AllDay24HourTimetableCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
                return cell
            }
            let hour = hours[indexPath.row]
            cell.setupCell(hour: hour, weather: weather.weather)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }
    
}

