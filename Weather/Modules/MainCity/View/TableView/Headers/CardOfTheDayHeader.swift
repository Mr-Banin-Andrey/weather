
import Foundation
import UIKit
import SnapKit

class CardOfTheDayHeader: UITableViewHeaderFooterView {
    
    let customImageView = CustomImageView()
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor(named: "figmaColorBlue")
        cardView.layer.cornerRadius = 5
        return cardView
    }()
    
    private lazy var semicircleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Ellipse")
        customImageView.editColorImageView(color: UIColor(named: "figmaColorYellow") ?? .black, imageView: image)
        return image
    }()
    
    
    private lazy var sunriseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "восход")
        customImageView.editColorImageView(color: UIColor(named: "figmaColorYellow") ?? .black, imageView: image)
        return image
    }()
    
    
    private lazy var sunsetImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "заход")
        customImageView.editColorImageView(color: UIColor(named: "figmaColorYellow") ?? .black, imageView: image)
        return image
    }()
    
    private lazy var sunriseTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Medium", size: 14)
        label.textColor = .white
        label.text = "09:41"
        return label
    }()
    
    private lazy var sunsetTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Medium", size: 14)
        label.textColor = .white
        label.text = "09:41"
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
    
    private lazy var fromMinToMaxDegreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = .white
        label.text = "7°/13°"
        return label
    }()
    
    private lazy var degreeNowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Medium", size: 36)
        label.textColor = .white
        label.text = "13"
        return label
    }()
    
    private lazy var probabilityOfPrecipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = .white
        label.text = "Возможен небольшой дождь"
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
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .white
        label.text = "0 УФ"
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
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .white
        label.text = "3 м/с"
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
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .white
        label.text = "75%"
        return label
    }()
    
    private lazy var timeAndDateNowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = UIColor(named: "figmaColorYellow")
        label.text = "17:48,  пт 16 апреля"
        return label
    }()
    
    private lazy var detailedWeatherForTheDayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подробнее на 24 часа", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func twoFontInLabel() -> NSMutableAttributedString {
        let fontFirst = [NSAttributedString.Key.font : UIFont(name: "Rubik-Light_Medium", size: 36)]
        let fontSecond = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 40, weight: .ultraLight) ]
        let mutblStringFirst = NSMutableAttributedString(string:"13", attributes:fontFirst as [NSAttributedString.Key : Any])
        let mutblStringSecond = NSMutableAttributedString(string:"°", attributes:fontSecond as [NSAttributedString.Key : Any])
        
        mutblStringFirst.append(mutblStringSecond)
        return mutblStringFirst
    }
    
    private func setupUi() {
        
        self.degreeNowLabel.attributedText = self.twoFontInLabel()
        
        self.addSubview(self.cardView)
        self.addSubview(self.semicircleImageView)
        self.addSubview(self.sunriseImageView)
        self.addSubview(self.sunriseTimeLabel)
        self.addSubview(self.sunsetImageView)
        self.addSubview(self.sunsetTimeLabel)
        
        self.addSubview(self.weatherDayStackView)
        self.weatherDayStackView.addArrangedSubview(self.fromMinToMaxDegreeLabel)
        self.weatherDayStackView.addArrangedSubview(self.degreeNowLabel)
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
            make.top.equalTo(self.snp.top) //.inset(20)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(212)
//            make.bottom.equalToSuperview() //.inset(16)
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
//            make.trailing.equalTo(self.cardView.snp.trailing).inset(301)
            make.bottom.equalTo(self.cardView.snp.bottom).offset(-51)
            make.width.equalTo(17)
        }
        
        self.sunriseTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.sunriseImageView.snp.bottom).offset(5)
            make.leading.equalTo(self.cardView.snp.leading).inset(16)
//            make.trailing.equalTo(self.cardView.snp.trailing).inset(301)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(26)
        }
        
        self.sunsetImageView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(144)
//            make.leading.equalTo(self.cardView.snp.leading).inset(24)
            make.trailing.equalTo(self.cardView.snp.trailing).inset(24)
            make.bottom.equalTo(self.cardView.snp.bottom).offset(-51)
            make.width.equalTo(17)
        }
        
        self.sunsetTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.sunriseImageView.snp.bottom).offset(5)
//            make.leading.equalTo(self.cardView.snp.leading).inset(16)
            make.trailing.equalTo(self.cardView.snp.trailing).inset(16)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(26)
        }
        
        self.weatherDayStackView.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.top).inset(32)
            make.centerX.equalTo(self.cardView.snp.centerX)
        }
        
        self.precipitationDayStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardView.snp.centerX)
            make.top.equalTo(self.cardView.snp.top).inset(130)
        }
        
        self.timeAndDateNowLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardView.snp.centerX)
            make.bottom.equalTo(self.cardView.snp.bottom).inset(22)
        }
        
        self.detailedWeatherForTheDayButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.cardView.snp.bottom).inset(33)
            
            make.height.equalTo(20)
            
            make.bottom.equalToSuperview() //.offset(20)
        }
    }
    
    
}


