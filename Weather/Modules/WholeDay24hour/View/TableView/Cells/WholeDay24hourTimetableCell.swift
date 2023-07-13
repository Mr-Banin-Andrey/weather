
import Foundation
import UIKit
import SnapKit

class WholeDay24hourTimetableCell: UITableViewCell {
    
    //MARK: - Properties
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.white.rawValue)
        return view
    }()
    
    private lazy var dateTimeDegreeStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        label.text = "пт 16/04"
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.text = "00:00"
        return label
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
    private lazy var cellUnderlineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 6
        return stack
    }()
    
    //MARK: - -degree
    private lazy var descriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    
    private lazy var descriptionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "crescent-moon1")
        image.heightAnchor.constraint(equalToConstant: 12).isActive = true
        image.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Преимущественно облачно По ощущению 13°"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
//    MARK: - -speed wind
    private lazy var windSpeedGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 30
        return stack
    }()
    
    private lazy var windSpeedImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 3
        stack.alignment = .center
        return stack
    }()
    
    private lazy var windSpeedImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ветер-1")
        image.heightAnchor.constraint(equalToConstant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 15).isActive = true
        return image
    }()
    
    private lazy var windSpeedNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ветер"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var windSpeedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2 m/s CCЗ"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
//    MARK: - -precipitation
    private lazy var precipitationGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 30
        return stack
    }()
    
    private lazy var precipitationImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    
    private lazy var precipitationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-5")
        image.heightAnchor.constraint(equalToConstant: 13).isActive = true
        image.widthAnchor.constraint(equalToConstant: 11).isActive = true
        return image
    }()
    
    private lazy var precipitationNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Атмосферные осадки"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var precipitationValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
//    MARK: - -cloudiness
    private lazy var cloudinessGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 30
        return stack
    }()
    
    private lazy var cloudinessImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    
    private lazy var cloudinessImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-3")
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 14).isActive = true
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
        label.text = "29%"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(named: ListColors.white.rawValue)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupUi() {
        
        self.addSubview(self.backView)
        self.addSubview(self.cellUnderlineView)
        
        self.addSubview(self.dateTimeDegreeStackView)
        self.dateTimeDegreeStackView.addArrangedSubview(self.dateLabel)
        self.dateTimeDegreeStackView.addArrangedSubview(self.timeLabel)
        self.dateTimeDegreeStackView.addArrangedSubview(self.degreeLabel)
        
        self.addSubview(self.generalStackView)
        
        self.generalStackView.addArrangedSubview(self.descriptionStackView)
        self.descriptionStackView.addArrangedSubview(self.descriptionImage)
        self.descriptionStackView.addArrangedSubview(self.descriptionLabel)
       
        self.generalStackView.addArrangedSubview(self.windSpeedGeneralStackView)
        self.windSpeedGeneralStackView.addArrangedSubview(self.windSpeedImageLabelStackView)
        self.windSpeedImageLabelStackView.addArrangedSubview(self.windSpeedImage)
        self.windSpeedImageLabelStackView.addArrangedSubview(self.windSpeedNameLabel)
        self.windSpeedGeneralStackView.addArrangedSubview(self.windSpeedValueLabel)
        
        self.generalStackView.addArrangedSubview(self.precipitationGeneralStackView)
        self.precipitationGeneralStackView.addArrangedSubview(self.precipitationImageLabelStackView)
        self.precipitationImageLabelStackView.addArrangedSubview(self.precipitationImage)
        self.precipitationImageLabelStackView.addArrangedSubview(self.precipitationNameLabel)
        self.precipitationGeneralStackView.addArrangedSubview(self.precipitationValueLabel)
        
        self.generalStackView.addArrangedSubview(self.cloudinessGeneralStackView)
        self.cloudinessGeneralStackView.addArrangedSubview(self.cloudinessImageLabelStackView)
        self.cloudinessImageLabelStackView.addArrangedSubview(self.cloudinessImage)
        self.cloudinessImageLabelStackView.addArrangedSubview(self.cloudinessNameLabel)
        self.cloudinessGeneralStackView.addArrangedSubview(self.cloudinessValueLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(15)
            make.leading.equalTo(self.backView.snp.leading).inset(16)
        }
        
        self.cellUnderlineView.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(16)
            make.trailing.equalTo(self.backView.snp.trailing).inset(16)
            make.bottom.equalTo(self.backView.snp.bottom)
            make.height.equalTo(1)
        }
        
        self.generalStackView.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(45)
            make.leading.equalTo(self.backView.snp.leading).inset(74)
            make.trailing.equalTo(self.backView.snp.trailing).inset(16)
            make.bottom.equalTo(self.backView.snp.bottom).inset(8)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
        
        self.windSpeedNameLabel.snp.makeConstraints { make in
            make.width.equalTo(49)
            make.height.equalTo(19)
        }
        self.precipitationNameLabel.snp.makeConstraints { make in
            make.width.equalTo(158)
            make.height.equalTo(19)
        }
        self.cloudinessNameLabel.snp.makeConstraints { make in
            make.width.equalTo(128)
            make.height.equalTo(19)
        }
    }
}
