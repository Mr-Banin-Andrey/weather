
import Foundation
import UIKit

class HourlyWeatherCollectionViewCell: UITableViewCell {
    
    private var weather = [NetworkServiceWeatherModel]()
    private var hours = [Hours]()
        
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HourlyWeatherCellInTableViewCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadCollectionView() {
        self.collectionView.reloadData()
    }
    
    func addWeatherInArray(weather: NetworkServiceWeatherModel) {
        if self.weather.isEmpty {
            self.weather.append(weather)
            addHoursInArray(weather: weather)
        } else {
            self.weather.removeAll()
            self.weather.append(weather)
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
//        hours.forEach { v in
//            print(v)
//        }
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
    
    private func setupUi() {
        self.contentView.addSubview(collectionView)
                
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.collectionView.heightAnchor.constraint(equalToConstant: 95)
        ])
    }
    
}

extension HourlyWeatherCollectionViewCell:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? HourlyWeatherCellInTableViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
            return cell
        }
        if indexPath.row == 0 {
            cell.setupSelect()
        } else {
            cell.setupDeselect()
        }
        let hour = hours[indexPath.row]
        cell.setupCell(hour: hour, weather: weather[0])
        return cell
    }
    
   func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
   ) -> CGSize {

        return CGSize(width: 50, height: 95)
    }
    
}
