
import Foundation
import UIKit
import SnapKit

class CardOfTheDayHeader: UITableViewHeaderFooterView {
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor(named: "figmaColorBlue")
        cardView.layer.cornerRadius = 5
        return cardView
    }()
    
    private lazy var ellipseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Ellipse")
        image.tintColor =  UIColor(named: "figmaColorYellow")
        image.backgroundColor = UIColor(named: "figmaColorBlue")
        return image
    }()
    
    private lazy var sunriseImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "восход")
        return image
    }()
    
    
    private lazy var sunsetImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "заход")
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
        label.text = "13°"
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
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        
        self.addSubview(self.cardView)
        self.addSubview(self.ellipseImageView)
        self.addSubview(self.sunriseImageView)
        self.addSubview(self.sunriseTimeLabel)
        self.addSubview(self.sunsetImageView)
        self.addSubview(self.sunsetTimeLabel)
        self.addSubview(self.weatherDayStackView)
        self.weatherDayStackView.addArrangedSubview(self.fromMinToMaxDegreeLabel)
        self.weatherDayStackView.addArrangedSubview(self.degreeNowLabel)
        self.weatherDayStackView.addArrangedSubview(self.probabilityOfPrecipitationLabel)
        
        
        self.cardView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top) //.inset(20)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(212)
            make.bottom.equalToSuperview() //.inset(16)
        }
        
        self.ellipseImageView.snp.makeConstraints { make in
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
    }
}
