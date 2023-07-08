
import Foundation
import UIKit
import SnapKit

class DailyForecastCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "figmaColorWhite")
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = #colorLiteral(red: 0.6681012511, green: 0.6539016962, blue: 0.6535986066, alpha: 1)
        label.text = "08/07"
        return label
    }()
    
    private lazy var precipitationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-2")
        return image
    }()
    
    private lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 12)
        label.textColor = UIColor(named: "figmaColorBlue")
        label.text = "57%"
        return label
    }()
    
    private lazy var descriptionWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.textColor = .black
        label.text = "Местами дождь"
        return label
    }()
    
    private lazy var fromMinToMaxDegreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 18)
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
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(56)
        }
    }
    
}
