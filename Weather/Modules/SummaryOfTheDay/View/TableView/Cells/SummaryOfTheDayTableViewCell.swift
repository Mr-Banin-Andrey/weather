
import Foundation
import UIKit
import SnapKit

class SummaryOfTheDayTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.white.rawValue)
        return view
    }()
    
    private lazy var underOneLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var underTwoLineView: UIView = {
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
    
    //MARK: - 1. temperatureFeels
    private lazy var temperatureFeelsGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 30
        return stack
    }()
    
    private lazy var temperatureFeelsImageLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 15
        stack.alignment = .center
        return stack
    }()
    
    private lazy var temperatureFeelsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-6")
        image.heightAnchor.constraint(equalToConstant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 15).isActive = true
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
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    //MARK: - 2. speed wind
//    private lazy var windSpeedGeneralStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .equalSpacing
//            stack.spacing = 30
//            return stack
//        }()
//
//        private lazy var windSpeedImageLabelStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .fillProportionally
//            stack.spacing = 3
//            stack.alignment = .center
//            return stack
//        }()
//
//        private lazy var windSpeedImage: UIImageView = {
//            let image = UIImageView()
//            image.translatesAutoresizingMaskIntoConstraints = false
//            image.image = UIImage(named: "ветер-1")
//            image.heightAnchor.constraint(equalToConstant: 10).isActive = true
//            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
//            return image
//        }()
//
//        private lazy var windSpeedNameLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Ветер"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = .black
//            return label
//        }()
//
//        private lazy var windSpeedValueLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "2 m/s CCЗ"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = UIColor(named: ListColors.gray.rawValue)
//            return label
//        }()
    
    //MARK: - 3. speed wind
//        private lazy var windSpeedGeneralStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .equalSpacing
//            stack.spacing = 30
//            return stack
//        }()
//
//        private lazy var windSpeedImageLabelStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .fillProportionally
//            stack.spacing = 3
//            stack.alignment = .center
//            return stack
//        }()
//
//        private lazy var windSpeedImage: UIImageView = {
//            let image = UIImageView()
//            image.translatesAutoresizingMaskIntoConstraints = false
//            image.image = UIImage(named: "ветер-1")
//            image.heightAnchor.constraint(equalToConstant: 10).isActive = true
//            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
//            return image
//        }()
//
//        private lazy var windSpeedNameLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Ветер"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = .black
//            return label
//        }()
//
//        private lazy var windSpeedValueLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "2 m/s CCЗ"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = UIColor(named: ListColors.gray.rawValue)
//            return label
//        }()
    
    //MARK: - 4. speed wind
//        private lazy var windSpeedGeneralStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .equalSpacing
//            stack.spacing = 30
//            return stack
//        }()
//
//        private lazy var windSpeedImageLabelStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .fillProportionally
//            stack.spacing = 3
//            stack.alignment = .center
//            return stack
//        }()
//
//        private lazy var windSpeedImage: UIImageView = {
//            let image = UIImageView()
//            image.translatesAutoresizingMaskIntoConstraints = false
//            image.image = UIImage(named: "ветер-1")
//            image.heightAnchor.constraint(equalToConstant: 10).isActive = true
//            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
//            return image
//        }()
//
//        private lazy var windSpeedNameLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Ветер"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = .black
//            return label
//        }()
//
//        private lazy var windSpeedValueLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "2 m/s CCЗ"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = UIColor(named: ListColors.gray.rawValue)
//            return label
//        }()
    
    //MARK: - 5. speed wind
//        private lazy var windSpeedGeneralStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .equalSpacing
//            stack.spacing = 30
//            return stack
//        }()
//
//        private lazy var windSpeedImageLabelStackView: UIStackView = {
//            let stack = UIStackView()
//            stack.translatesAutoresizingMaskIntoConstraints = false
//            stack.axis = .horizontal
//            stack.distribution = .fillProportionally
//            stack.spacing = 3
//            stack.alignment = .center
//            return stack
//        }()
//
//        private lazy var windSpeedImage: UIImageView = {
//            let image = UIImageView()
//            image.translatesAutoresizingMaskIntoConstraints = false
//            image.image = UIImage(named: "ветер-1")
//            image.heightAnchor.constraint(equalToConstant: 10).isActive = true
//            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
//            return image
//        }()
//
//        private lazy var windSpeedNameLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "Ветер"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = .black
//            return label
//        }()
//
//        private lazy var windSpeedValueLabel: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "2 m/s CCЗ"
//            label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
//            label.textColor = UIColor(named: ListColors.gray.rawValue)
//            return label
//        }()
    
    
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
        
        self.addSubview(self.backView)
        
        self.addSubview(self.generalStackView)
        
        self.generalStackView.addArrangedSubview(self.windSpeedGeneralStackView)
        self.windSpeedGeneralStackView.addArrangedSubview(self.windSpeedImageLabelStackView)
        self.windSpeedImageLabelStackView.addArrangedSubview(self.windSpeedImage)
        self.windSpeedImageLabelStackView.addArrangedSubview(self.windSpeedNameLabel)
        self.windSpeedGeneralStackView.addArrangedSubview(self.windSpeedValueLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(341)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
