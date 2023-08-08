
import Foundation
import UIKit

class SummaryOfTheDayCollectionView: UITableViewCell {
    
    var tapAction: ((Forecasts) -> Void)?
        
    private var forecast = [Forecasts]()
    private var weather: NetworkServiceWeatherModel?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SummaryOfTheDayCollectionViewCell.self, forCellWithReuseIdentifier: "SummaryOfTheDayCustomCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "summaryOfTheDayDefaultId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    private override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addForecast(forecast: Forecasts, weather: NetworkServiceWeatherModel) {
        if self.forecast.isEmpty {
            self.forecast.append(forecast)
            self.weather = weather
        } else {
            self.forecast.removeAll()
            self.forecast.append(forecast)
            self.weather = weather
        }
    }
    
    private func setupUi() {
        self.contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension SummaryOfTheDayCollectionView:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = weather?.forecasts.count else { return 0 }
        return count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummaryOfTheDayCustomCell", for: indexPath) as? SummaryOfTheDayCollectionViewCell,
            let weather = weather
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summaryOfTheDayDefaultId", for: indexPath)
            return cell
        }
        
        if forecast[0].date_ts == weather.forecasts[indexPath.row+1].date_ts {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        }
        
        cell.setupDate(weather: weather, index: (indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SummaryOfTheDayCollectionViewCell {

            guard let forecast = cell.forecast else { return }
            tapAction?(forecast)
            cell.isSelected = true
        }
//        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
//        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SummaryOfTheDayCollectionViewCell {
            cell.isSelected = false
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 90, height: 40)
    }
    
}
