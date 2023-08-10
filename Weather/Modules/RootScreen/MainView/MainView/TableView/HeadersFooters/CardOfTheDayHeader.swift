
import Foundation
import UIKit
import SnapKit

class CardOfTheDayHeader: UITableViewHeaderFooterView {
    
    private let customImageView = CustomImageView()
        
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor(named: ListColors.blue.rawValue)
        cardView.layer.cornerRadius = 5
        return cardView
    }()
    
    private lazy var semicircleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Ellipse")
        return image
    }()
    
    private lazy var sunriseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "восход")
        customImageView.editColorImageView(color: UIColor(named: ListColors.yellow.rawValue) ?? .black, imageView: image)
        return image
    }()
    
    private lazy var sunsetImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "заход")
        customImageView.editColorImageView(color: UIColor(named: ListColors.yellow.rawValue) ?? .black, imageView: image)
        return image
    }()
    
    private lazy var sunriseTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var sunsetTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var weatherDayStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var fromMinToMaxGradusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var gradusNowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 36)
        label.textColor = .white
        return label
    }()
    
    private lazy var probabilityOfPrecipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var precipitationDayStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 18
        stack.alignment = .center
        return stack
    }()
    
    private lazy var uVIndexStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var uVIndexImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame")
        return image
    }()
    
    private lazy var uVIndexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var windImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ветерФигма")
        return image
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var precipitationStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var precipitationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "осадкиФигма")
        return image
    }()
    
    private lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var timeAndDateNowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = UIColor(named: ListColors.yellow.rawValue)
        label.text = "17:48,  пт 16 апреля"
        return label
    }()
    
    lazy var detailedWeatherForTheDayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        button.setAttributedTitle("Подробнее на 24 часа".underLined, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupValue(weather: NetworkServiceWeatherModel) {
        
        let description = WeatherDescription()
        let gradus = DecodingOfGradus.shared
        let keyTemp = SettingsUserDefaults().getValue(key: .temperature)
        
        self.sunriseTimeLabel.text = weather.forecasts[0].rise_begin
        self.sunsetTimeLabel.text = weather.forecasts[0].set_end
        
        self.fromMinToMaxGradusLabel.text = gradus.minToMaxGradus(weather: weather,
                                                                  index: 0,
                                                                  separator: .slash,
                                                                  toFahrenheit: keyTemp)
        
        self.gradusNowLabel.text = gradus.celsiusToFahrenheit(gradus: weather.fact.temp, toFahrenheit: keyTemp)
        
        self.probabilityOfPrecipitationLabel.text =  description.condition[weather.fact.condition]
        self.uVIndexLabel.text = "\(String(weather.fact.uv_index)) УФ"
        
        self.windLabel.text = "\(DecodingOfSpeed.shared.toMsOrKmH(ms: weather.fact.wind_speed)) \(description.windDir[weather.fact.wind_dir] ?? "")"
        
        self.precipitationLabel.text = description.precipitationOrCloudness[weather.fact.prec_strength]
        
        self.timeAndDateNowLabel.text = DecodingOfDate.shared.codeDate(
            unixTime: weather.now,
            dateFormat: .hourMinDayWeekDayMonth,
            secondsFromGMT: weather.info.tzinfo.offset
        )
    }
    
//    private func twoFontInLabel(value:String) -> NSMutableAttributedString {
//        let fontFirst = [NSAttributedString.Key.font : UIFont(name: ListFonts.medium500.rawValue, size: 36)]
//        let fontSecond = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 40, weight: .ultraLight) ]
//        let mutblStringFirst = NSMutableAttributedString(string:value, attributes:fontFirst as [NSAttributedString.Key : Any])
//        let mutblStringSecond = NSMutableAttributedString(string:"°", attributes:fontSecond as [NSAttributedString.Key : Any])
//
//        mutblStringFirst.append(mutblStringSecond)
//        return mutblStringFirst
//    }
    
    private func setupUi() {
                
        self.addSubview(self.cardView)
        self.addSubview(self.semicircleImageView)
        self.addSubview(self.sunriseImageView)
        self.addSubview(self.sunriseTimeLabel)
        self.addSubview(self.sunsetImageView)
        self.addSubview(self.sunsetTimeLabel)
        
        self.addSubview(self.weatherDayStackView)
        self.weatherDayStackView.addArrangedSubview(self.fromMinToMaxGradusLabel)
        self.weatherDayStackView.addArrangedSubview(self.gradusNowLabel)
        self.weatherDayStackView.addArrangedSubview(self.probabilityOfPrecipitationLabel)
        
        self.addSubview(self.precipitationDayStackView)
        self.precipitationDayStackView.addArrangedSubview(self.uVIndexStackView)
        self.precipitationDayStackView.addArrangedSubview(self.windStackView)
        self.precipitationDayStackView.addArrangedSubview(self.precipitationStackView)
        
        self.uVIndexStackView.addArrangedSubview(self.uVIndexImageView)
        self.uVIndexStackView.addArrangedSubview(self.uVIndexLabel)
        
        self.windStackView.addArrangedSubview(self.windImageView)
        self.windStackView.addArrangedSubview(self.windLabel)
        
        self.precipitationStackView.addArrangedSubview(self.precipitationImageView)
        self.precipitationStackView.addArrangedSubview(self.precipitationLabel)
        
        self.addSubview(self.timeAndDateNowLabel)
        self.addSubview(self.detailedWeatherForTheDayButton)
        
        self.cardView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(20)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(212)
        }
        
        self.semicircleImageView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(16)
            make.leading.equalTo(self.cardView.snp.leading).inset(32)
            make.trailing.equalTo(self.cardView.snp.trailing).inset(32)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(72)
        }
        
        self.sunriseImageView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(144)
            make.leading.equalTo(self.cardView.snp.leading).inset(24)
            make.bottom.equalTo(self.cardView.snp.bottom).offset(-51)
            make.width.equalTo(17)
        }
        
        self.sunriseTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.sunriseImageView.snp.bottom).offset(5)
            make.leading.equalTo(self.cardView.snp.leading).inset(16)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(26)
        }
        
        self.sunsetImageView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(144)
            make.trailing.equalTo(self.cardView.snp.trailing).inset(24)
            make.bottom.equalTo(self.cardView.snp.bottom).offset(-51)
            make.width.equalTo(17)
        }
        
        self.sunsetTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.sunriseImageView.snp.bottom).offset(5)
            make.trailing.equalTo(self.cardView.snp.trailing).inset(16)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(26)
        }
        
        self.weatherDayStackView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(32)
            make.centerX.equalTo(self.cardView.snp.centerX)
        }
        
        self.precipitationDayStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardView.snp.centerX)
            make.top.equalTo(self.cardView.snp.top).inset(136)
        }
        
        self.timeAndDateNowLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardView.snp.centerX)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(22)
        }
        
        self.detailedWeatherForTheDayButton.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.bottom).offset(33)
            make.height.equalTo(20)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    }
}
