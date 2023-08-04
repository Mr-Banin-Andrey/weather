
import Foundation
import UIKit
import SnapKit

class DailyForecastCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.white.rawValue)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
//        label.text = "08/07"
        return label
    }()
    
    private lazy var precipitationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()
    
    private lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 12)
        label.textColor = UIColor(named: ListColors.blue.rawValue)
        label.text = "57%"
        return label
    }()
    
    private lazy var descriptionWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
//        label.text = "Местами дождь"
        return label
    }()
    
    private lazy var fromMinToMaxDegreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.textColor = .black
        label.text = "7°-13°"
        return label
    }()
    
    private lazy var transitionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "next1")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(for weather: NetworkServiceWeatherModel, index: Int) {
        
//        let index = index
        
        self.dateLabel.text = EditingFunctions().codeDate(unixTime: weather.forecasts[index].date_ts, dateFormat: .dayMonths, secondsFromGMT: weather.info.tzinfo.offset)
        self.precipitationLabel.text = String(weather.forecasts[index].parts.day_short.prec_strength)
        self.descriptionWeather.text = EditingFunctions().condition[weather.forecasts[index].parts.day_short.condition]
        self.fromMinToMaxDegreeLabel.text = "\(String(weather.forecasts[index].parts.day_short.temp_min))°-\(String(weather.forecasts[index].parts.night_short.temp))°"
    }
    
    private func setupUi() {
        self.addSubview(self.backView)
        self.addSubview(self.dateLabel)
        self.addSubview(self.precipitationImage)
        self.addSubview(self.precipitationLabel)
        self.addSubview(self.descriptionWeather)
        self.addSubview(self.fromMinToMaxDegreeLabel)
        self.addSubview(self.transitionImage)


        self.backView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(5).priority(.high)
            make.height.equalTo(56)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(5)
            make.leading.equalTo(self.backView.snp.leading).inset(10)
            make.height.equalTo(19)
            make.width.equalTo(48)
        }
        
        self.precipitationImage.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(10)
            make.bottom.equalTo(self.backView.snp.bottom).inset(10)
        }
        
        self.precipitationLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.precipitationImage.snp.trailing).offset(5)
            make.bottom.equalTo(self.backView.snp.bottom).inset(10)
        }
        
        self.descriptionWeather.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(19)
            make.leading.equalTo(self.dateLabel.snp.trailing).offset(16)
            make.trailing.equalTo(self.backView.snp.trailing).inset(75)
            make.height.equalTo(19)
            make.bottom.equalTo(self.backView.snp.bottom).inset(18)
        }
        
        self.fromMinToMaxDegreeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(17)
            make.leading.equalTo(self.descriptionWeather.snp.trailing).offset(5)
            make.height.equalTo(22)
            make.bottom.equalTo(self.backView.snp.bottom).inset(17)
        }
        
        self.transitionImage.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(23)
            make.trailing.equalTo(self.backView.snp.trailing).inset(10)
            make.height.equalTo(10)
            make.width.equalTo(6)
        }
        
    }
    
}
