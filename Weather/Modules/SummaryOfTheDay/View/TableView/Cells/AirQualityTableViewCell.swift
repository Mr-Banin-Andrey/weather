
import UIKit
import SnapKit

class AirQualityTableViewCell: UITableViewCell {

    //MARK: - Properties
    private lazy var airTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Качество воздуха"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 30)
        label.textColor = .black
        return label
    }()
    
    private lazy var estimationBackView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.green.rawValue)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var estimationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "хорошо"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionAirQuality: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)        
        label.numberOfLines = 4
        label.text = "Качество воздуха считается удовлетворительным и загрязнения воздуха представляются незначительными в пределах нормы"
        return label
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

    private func setupUi() {
        self.addSubview(self.airTitleLabel)
        self.addSubview(self.scoreLabel)
        self.addSubview(self.estimationBackView)
        self.estimationBackView.addSubview(self.estimationLabel)
        self.addSubview(self.descriptionAirQuality)
        
        self.airTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading).inset(16)
        }
        
        self.scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(self.airTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.snp.leading).inset(16)
        }
        
        self.estimationBackView.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(96)
            make.top.equalTo(self.airTitleLabel.snp.bottom).offset(15)
            make.leading.equalTo(self.scoreLabel.snp.trailing).offset(16)
        }
        
        self.estimationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.estimationBackView.snp.centerY)
            make.centerX.equalTo(self.estimationBackView.snp.centerX)
        }
        
        
        self.descriptionAirQuality.snp.makeConstraints { make in
            make.top.equalTo(self.scoreLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.bottom.equalTo(self.snp.bottom)
        }
    }

}
