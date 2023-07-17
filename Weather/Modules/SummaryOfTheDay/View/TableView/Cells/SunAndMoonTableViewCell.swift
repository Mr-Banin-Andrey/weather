
import Foundation
import UIKit
import SnapKit

class SunAndMoonTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var sunAndMoonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Солнце и Луна"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var fullMoonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Полнолуние"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = UIColor(named: ListColors.blue.rawValue)
        image.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image.widthAnchor.constraint(equalToConstant: 15).isActive = true
        return image
    }()
    
    private lazy var verticalLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 0.5
        line.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - sunStackView
    private lazy var sunGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 19
        return stack
    }()
    
    private lazy var sunTimeImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var sunTimeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame")
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return image
    }()
    
    private lazy var sunTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14ч 27 мин"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var sunriseImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var sunriseTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Восход"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    private lazy var sunriseTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:19"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var sunsetImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var sunsetTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Заход"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    private lazy var sunsetTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19:46"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var oneDashedLineSunView: DashedViewHorizontal = {
        let view = DashedViewHorizontal()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: ListColors.blue.rawValue) ?? .black
        view.config.dashGap = 5
        view.config.dashLength = 5
        return view
    }()
    
    private lazy var twoDashedLineSunView: DashedViewHorizontal = {
        let view = DashedViewHorizontal()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: ListColors.blue.rawValue) ?? .black
        view.config.dashGap = 5
        view.config.dashLength = 5
        return view
    }()
    
    //MARK: - moonStackView
    private lazy var moonGeneralStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 19
        return stack
    }()
    
    private lazy var moonTimeImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var moonTimeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "crescent-moon1")
        image.heightAnchor.constraint(equalToConstant: 18).isActive = true
        image.widthAnchor.constraint(equalToConstant: 18).isActive = true
        return image
    }()
    
    private lazy var moonTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14ч 27 мин"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var moonriseImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var moonriseTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Восход"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    private lazy var moonriseTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:19"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var moonsetImageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 35
        return stack
    }()
    
    private lazy var moonsetTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Заход"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        return label
    }()
    
    private lazy var moonsetTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19:46"
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var oneDashedLineMoonView: DashedViewHorizontal = {
        let view = DashedViewHorizontal()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: ListColors.blue.rawValue) ?? .black
        view.config.dashGap = 5
        view.config.dashLength = 5
        return view
    }()
    
    private lazy var twoDashedLineMoonView: DashedViewHorizontal = {
        let view = DashedViewHorizontal()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: ListColors.blue.rawValue) ?? .black
        view.config.dashGap = 5
        view.config.dashLength = 5
        return view
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
        self.addSubview(self.backView)
        self.addSubview(self.sunAndMoonTitleLabel)
        self.addSubview(self.fullMoonTitleLabel)
        self.addSubview(self.weatherImage)
        self.addSubview(self.verticalLineView)
        
        self.addSubview(self.sunGeneralStackView)
        self.sunGeneralStackView.addArrangedSubview(self.sunTimeImageAndLabelStackView)
        self.sunTimeImageAndLabelStackView.addArrangedSubview(self.sunTimeImage)
        self.sunTimeImageAndLabelStackView.addArrangedSubview(self.sunTimeLabel)

        self.sunGeneralStackView.addArrangedSubview(self.sunriseImageAndLabelStackView)
        self.sunriseImageAndLabelStackView.addArrangedSubview(self.sunriseTitleLabel)
        self.sunriseImageAndLabelStackView.addArrangedSubview(self.sunriseTimeLabel)

        self.sunGeneralStackView.addArrangedSubview(self.sunsetImageAndLabelStackView)
        self.sunsetImageAndLabelStackView.addArrangedSubview(self.sunsetTitleLabel)
        self.sunsetImageAndLabelStackView.addArrangedSubview(self.sunsetTimeLabel)
        
        self.addSubview(self.oneDashedLineSunView)
        self.addSubview(self.twoDashedLineSunView)
        
        self.addSubview(self.moonGeneralStackView)
        self.moonGeneralStackView.addArrangedSubview(self.moonTimeImageAndLabelStackView)
        self.moonTimeImageAndLabelStackView.addArrangedSubview(self.moonTimeImage)
        self.moonTimeImageAndLabelStackView.addArrangedSubview(self.moonTimeLabel)

        self.moonGeneralStackView.addArrangedSubview(self.moonriseImageAndLabelStackView)
        self.moonriseImageAndLabelStackView.addArrangedSubview(self.moonriseTitleLabel)
        self.moonriseImageAndLabelStackView.addArrangedSubview(self.moonriseTimeLabel)

        self.moonGeneralStackView.addArrangedSubview(self.moonsetImageAndLabelStackView)
        self.moonsetImageAndLabelStackView.addArrangedSubview(self.moonsetTitleLabel)
        self.moonsetImageAndLabelStackView.addArrangedSubview(self.moonsetTimeLabel)
        
        self.addSubview(self.oneDashedLineMoonView)
        self.addSubview(self.twoDashedLineMoonView)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(162)
            make.top.equalTo(self.snp.top).inset(14)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.sunAndMoonTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.top.equalTo(self.backView.snp.top)
            make.leading.equalTo(self.backView.snp.leading)
        }
        
        self.fullMoonTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(19)
            make.top.equalTo(self.backView.snp.top)
            make.trailing.equalTo(self.backView.snp.trailing)
        }
        
        self.weatherImage.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top)
            make.trailing.equalTo(self.fullMoonTitleLabel.snp.leading).offset(-5)
        }
        
        self.verticalLineView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(1)
            make.top.equalTo(self.sunAndMoonTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.sunGeneralStackView.snp.makeConstraints { make in
            make.height.equalTo(97)
            make.top.equalTo(self.sunAndMoonTitleLabel.snp.bottom).offset(17)
            make.leading.equalTo(self.backView.snp.leading).inset(10)
            make.trailing.equalTo(self.verticalLineView.snp.leading).offset(-12)
        }
        
        self.oneDashedLineSunView.snp.makeConstraints { make in
            make.top.equalTo(self.sunTimeImageAndLabelStackView.snp.bottom).offset(9)
            make.leading.equalTo(self.sunGeneralStackView.snp.leading)
            make.trailing.equalTo(self.sunGeneralStackView.snp.trailing)
        }
        
        self.twoDashedLineSunView.snp.makeConstraints { make in
            make.top.equalTo(self.sunriseImageAndLabelStackView.snp.bottom).offset(9)
            make.leading.equalTo(self.sunGeneralStackView.snp.leading)
            make.trailing.equalTo(self.sunGeneralStackView.snp.trailing)
        }
        
        self.moonGeneralStackView.snp.makeConstraints { make in
            make.height.equalTo(97)
            make.top.equalTo(self.sunAndMoonTitleLabel.snp.bottom).offset(17)
            make.leading.equalTo(self.verticalLineView.snp.trailing).offset(12)
            make.trailing.equalTo(self.backView.snp.trailing).inset(10)
        }
        
        self.oneDashedLineMoonView.snp.makeConstraints { make in
            make.top.equalTo(self.moonTimeImageAndLabelStackView.snp.bottom).offset(9)
            make.leading.equalTo(self.moonGeneralStackView.snp.leading)
            make.trailing.equalTo(self.moonGeneralStackView.snp.trailing)
        }

        self.twoDashedLineMoonView.snp.makeConstraints { make in
            make.top.equalTo(self.moonriseImageAndLabelStackView.snp.bottom).offset(9)
            make.leading.equalTo(self.moonGeneralStackView.snp.leading)
            make.trailing.equalTo(self.moonGeneralStackView.snp.trailing)
        }
    }
}
