
import Foundation
import UIKit
import SnapKit

class HourlyWeatherCellInTableViewCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        return view
    }()
    
    private lazy var clockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.text = "09:41"
        label.textColor = .black
        return label
    }()
    
    private lazy var pictureWeatherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-5")
        return image
    }()
    
    private lazy var gradusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "23°"
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(hour: Hours, weather: NetworkServiceWeatherModel) {
        
        self.clockLabel.text = DecodingOfDate.shared.codeDate(unixTime: hour.hour_ts, dateFormat: .hourMin, secondsFromGMT: weather.info.tzinfo.offset)
        self.gradusLabel.text = String(hour.temp)
        self.pictureWeatherImage.image = selectImage(hour: hour)
    }
    
    
    func setupSelect() {
        self.backView.backgroundColor = UIColor(named: ListColors.blue.rawValue)
        self.clockLabel.textColor = .white
        self.gradusLabel.textColor = .white
    }
    
    private func selectImage(hour: Hours) -> UIImage {
        
        switch hour.condition {
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
//
//    func setupDeselect() {
//        self.backView.backgroundColor = nil
//        self.clockLabel.textColor = .black
//        self.gradusLabel.textColor = .black
//    }
    
    private func setupConstraints() {
        self.contentView.addSubview(self.backView)
        self.contentView.addSubview(self.clockLabel)
        self.contentView.addSubview(self.pictureWeatherImage)
        self.contentView.addSubview(self.gradusLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(84)
            make.width.equalTo(42)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.clockLabel.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(15)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.pictureWeatherImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.gradusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).inset(8)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
    }
}
