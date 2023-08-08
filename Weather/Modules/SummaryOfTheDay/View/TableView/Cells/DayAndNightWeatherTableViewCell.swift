
import Foundation
import UIKit
import SnapKit

class DayAndNightWeatherTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.white.rawValue)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var partOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "День"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var degreeStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 25)
        label.textColor = .black
        label.text = "13°"
        label.widthAnchor.constraint(equalToConstant: 36).isActive = true
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        image.widthAnchor.constraint(equalToConstant: 36).isActive = true
        image.contentMode = .center
        return image
    }()
    
    private lazy var degreeDescripsionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        label.text = "Ливни"
        return label
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 6
        return stack
    }()
    
    //MARK: - 1. temperatureFeelsAndUnderline
    private lazy var temperatureFeelsGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 90
        return stack
    }()
    
    private lazy var temperatureFeelsImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 19
        stack.alignment = .center
        return stack
    }()
    
    private lazy var temperatureFeelsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-6")
        image.heightAnchor.constraint(equalToConstant: 23).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return image
    }()

    private lazy var temperatureFeelsNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "По ощущениям"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var temperatureFeelsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "11°"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var underOneLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - 2. speedWindAndUnderline
    private lazy var speedWindGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 90
        return stack
    }()

    private lazy var speedWindImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 15
        stack.alignment = .center
        return stack
    }()

    private lazy var speedWindImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ветерФигма")
        image.heightAnchor.constraint(equalToConstant: 14).isActive = true
        image.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return image
    }()

    private lazy var speedWindNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ветер"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()

    private lazy var speedWindValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5 m/s ЗЮЗ"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()

    private lazy var underTwoLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - 3. uvIndexAndUnderline
   private lazy var uvIndexGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 90
        return stack
    }()

    private lazy var uvIndexImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 19
        stack.alignment = .center
        return stack
    }()

    private lazy var uvIndexImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame")
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return image
    }()

    private lazy var uvIndexNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Уф индекс"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()

    private lazy var uvIndexValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4( умерен.)"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()

    private lazy var underThreeLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - 4. rainAndUnderline
    private lazy var rainGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 90
        return stack
    }()

    private lazy var rainImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 21
        stack.alignment = .center
        return stack
    }()

    private lazy var rainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        image.heightAnchor.constraint(equalToConstant: 21).isActive = true
        image.widthAnchor.constraint(equalToConstant: 18).isActive = true
        return image
    }()
    
    private lazy var rainNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дождь"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()

    private lazy var rainValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "55%"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()

    private lazy var underFourLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - 5. cloudiness
    private lazy var cloudinessGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 90
        return stack
    }()

    private lazy var cloudinessImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 19
        stack.alignment = .center
        return stack
    }()

    private lazy var cloudinessImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-3")
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return image
    }()
    
    private lazy var cloudinessNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Облачность"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()

    private lazy var cloudinessValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "72%"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()

    private lazy var underFiveLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods

    func day(forecast: Forecasts) {
        guard
            let speed = forecast.parts.day_short.wind_speed,
            let speedDes = forecast.parts.day_short.wind_dir
        else { return }
        
        let description = WeatherDescription()
        
        self.partOfTheDayLabel.text = "День"
        self.degreeLabel.text = String(forecast.parts.day_short.temp)
        self.weatherImage.image = selectImageDay(date: forecast.parts.day_short)
        self.degreeDescripsionLabel.text = description.condition[forecast.parts.day_short.condition]

        self.temperatureFeelsValueLabel.text = String(forecast.parts.day_short.feels_like)
        self.speedWindValueLabel.text = "\(DecodingOfSpeed.shared.toMsOrKmH(ms: speed)) \(description.windDir[speedDes] ?? "")"
        self.uvIndexValueLabel.text = "\(description.uvIndexDescription(forecast.parts.day_short.uv_index ?? 0))"
        self.rainValueLabel.text = description.precipitationOrCloudness[forecast.parts.day_short.prec_strength]
        self.cloudinessValueLabel.text = description.precipitationOrCloudness[forecast.parts.day_short.cloudness]
    }
    
    
    func night(forecast: Forecasts) {
        guard
            let speed = forecast.parts.night_short.wind_speed,
            let speedDes = forecast.parts.night_short.wind_dir
        else { return }
        
        let description = WeatherDescription()
        
        self.partOfTheDayLabel.text = "Ночь"
        self.degreeLabel.text = String(forecast.parts.night_short.temp)
        self.weatherImage.image = selectImageNight(date: forecast.parts.night_short)
        self.degreeDescripsionLabel.text = description.condition[forecast.parts.night_short.condition]

        self.temperatureFeelsValueLabel.text = String(forecast.parts.night_short.feels_like)
        self.speedWindValueLabel.text = "\(DecodingOfSpeed.shared.toMsOrKmH(ms: speed)) \(description.windDir[speedDes] ?? "")"
        self.uvIndexValueLabel.text = "\(description.uvIndexDescription(forecast.parts.night_short.uv_index ?? 0))"
        self.rainValueLabel.text = description.precipitationOrCloudness[forecast.parts.night_short.prec_strength]
        self.cloudinessValueLabel.text = description.precipitationOrCloudness[forecast.parts.night_short.cloudness]
    }
    
    private func selectImageDay(date: DayShort) -> UIImage {
        
        switch date.condition {
        case "clear","partly-cloudy":
            return UIImage(named: ImageWeather.sun.rawValue) ?? UIImage()
        case "cloudy","overcast":
            return UIImage(named: ImageWeather.cloudiness.rawValue) ?? UIImage()
        case "light-rain","rain","light-snow","snow":
            return UIImage(named: ImageWeather.smallRain.rawValue) ?? UIImage()
        case "heavy-rain","showers","wet-snow","snow-showers","hail":
            return UIImage(named: ImageWeather.rain.rawValue) ?? UIImage()
        case "thunderstorm","thunderstorm-with-rain","thunderstorm-with-hail":
            return UIImage(named: ImageWeather.lightning.rawValue) ?? UIImage()
        default:
            ()
        }
        return UIImage()
    }
    
    private func selectImageNight(date: NightShort) -> UIImage {
        switch date.condition {
        case "clear","partly-cloudy":
            return UIImage(named: ImageWeather.sun.rawValue) ?? UIImage()
        case "cloudy","overcast":
            return UIImage(named: ImageWeather.cloudiness.rawValue) ?? UIImage()
        case "light-rain","rain","light-snow","snow":
            return UIImage(named: ImageWeather.smallRain.rawValue) ?? UIImage()
        case "heavy-rain","showers","wet-snow","snow-showers","hail":
            return UIImage(named: ImageWeather.rain.rawValue) ?? UIImage()
        case "thunderstorm","thunderstorm-with-rain","thunderstorm-with-hail":
            return UIImage(named: ImageWeather.lightning.rawValue) ?? UIImage()
        default:
            ()
        }
        return UIImage()
    }
    
    private func setupUi() {
        
        self.addSubview(self.backView)
        
        self.addSubview(self.generalStackView)
        
        self.generalStackView.addArrangedSubview(self.temperatureFeelsGeneralStackView)
        self.temperatureFeelsGeneralStackView.addArrangedSubview(self.temperatureFeelsImageLabelStackView)
        self.temperatureFeelsImageLabelStackView.addArrangedSubview(self.temperatureFeelsImage)
        self.temperatureFeelsImageLabelStackView.addArrangedSubview(self.temperatureFeelsNameLabel)
        self.temperatureFeelsGeneralStackView.addArrangedSubview(self.temperatureFeelsValueLabel)
        
        self.generalStackView.addArrangedSubview(self.speedWindGeneralStackView)
        self.speedWindGeneralStackView.addArrangedSubview(self.speedWindImageLabelStackView)
        self.speedWindImageLabelStackView.addArrangedSubview(self.speedWindImage)
        self.speedWindImageLabelStackView.addArrangedSubview(self.speedWindNameLabel)
        self.speedWindGeneralStackView.addArrangedSubview(self.speedWindValueLabel)

        self.generalStackView.addArrangedSubview(self.uvIndexGeneralStackView)
        self.uvIndexGeneralStackView.addArrangedSubview(self.uvIndexImageLabelStackView)
        self.uvIndexImageLabelStackView.addArrangedSubview(self.uvIndexImage)
        self.uvIndexImageLabelStackView.addArrangedSubview(self.uvIndexNameLabel)
        self.uvIndexGeneralStackView.addArrangedSubview(self.uvIndexValueLabel)
        
        self.generalStackView.addArrangedSubview(self.rainGeneralStackView)
        self.rainGeneralStackView.addArrangedSubview(self.rainImageLabelStackView)
        self.rainImageLabelStackView.addArrangedSubview(self.rainImage)
        self.rainImageLabelStackView.addArrangedSubview(self.rainNameLabel)
        self.rainGeneralStackView.addArrangedSubview(self.rainValueLabel)

        self.generalStackView.addArrangedSubview(self.cloudinessGeneralStackView)
        self.cloudinessGeneralStackView.addArrangedSubview(self.cloudinessImageLabelStackView)
        self.cloudinessImageLabelStackView.addArrangedSubview(self.cloudinessImage)
        self.cloudinessImageLabelStackView.addArrangedSubview(self.cloudinessNameLabel)
        self.cloudinessGeneralStackView.addArrangedSubview(self.cloudinessValueLabel)
        
        self.addSubview(self.underOneLineView)
        self.addSubview(self.underTwoLineView)
        self.addSubview(self.underThreeLineView)
        self.addSubview(self.underFourLineView)
        self.addSubview(self.underFiveLineView)
        
        self.addSubview(self.partOfTheDayLabel)
        self.addSubview(self.degreeStackView)
        self.degreeStackView.addArrangedSubview(self.weatherImage)
        self.degreeStackView.addArrangedSubview(self.degreeLabel)
        self.addSubview(self.degreeDescripsionLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(341)
            make.top.equalTo(self.snp.top).inset(6)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(6)
        }
        
        self.generalStackView.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(109)
            make.leading.equalTo(self.backView.snp.leading).inset(15)
            make.trailing.equalTo(self.backView.snp.trailing).inset(15)
            make.bottom.equalTo(self.backView.snp.bottom).inset(30)
        }
        
        self.temperatureFeelsNameLabel.snp.makeConstraints { make in
            make.width.equalTo(104)
            make.height.equalTo(19)
        }
        
        self.speedWindNameLabel.snp.makeConstraints { make in
            make.width.equalTo(42)
            make.height.equalTo(19)
        }
        self.uvIndexNameLabel.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(19)
        }
        self.rainNameLabel.snp.makeConstraints { make in
            make.width.equalTo(46)
            make.height.equalTo(19)
        }
        self.cloudinessNameLabel.snp.makeConstraints { make in
            make.width.equalTo(81)
            make.height.equalTo(19)
        }
        
        self.underOneLineView.snp.makeConstraints { make in
            make.top.equalTo(self.temperatureFeelsValueLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.backView.snp.leading)
            make.trailing.equalTo(self.backView.snp.trailing)
            make.height.equalTo(1)
        }
        
        self.underTwoLineView.snp.makeConstraints { make in
            make.top.equalTo(self.speedWindValueLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.backView.snp.leading)
            make.trailing.equalTo(self.backView.snp.trailing)
            make.height.equalTo(1)
        }
        
        self.underThreeLineView.snp.makeConstraints { make in
            make.top.equalTo(self.uvIndexValueLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.backView.snp.leading)
            make.trailing.equalTo(self.backView.snp.trailing)
            make.height.equalTo(1)
        }

        self.underFourLineView.snp.makeConstraints { make in
            make.top.equalTo(self.rainValueLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.backView.snp.leading)
            make.trailing.equalTo(self.backView.snp.trailing)
            make.height.equalTo(1)
        }
        
        self.underFiveLineView.snp.makeConstraints { make in
            make.top.equalTo(self.cloudinessValueLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.backView.snp.leading)
            make.trailing.equalTo(self.backView.snp.trailing)
            make.height.equalTo(1)
        }
        
        self.partOfTheDayLabel.snp.makeConstraints { make in
            make.width.equalTo(43)
            make.height.equalTo(22)
            make.top.equalTo(self.backView.snp.top).inset(21)
            make.leading.equalTo(self.backView.snp.leading).inset(15)
        }
        
        self.degreeStackView.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(37)
            make.top.equalTo(self.backView.snp.top).inset(15)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.degreeDescripsionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.degreeStackView.snp.bottom).offset(10)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
    }
}
