

import Foundation
import UIKit
import SnapKit

protocol SettingsViewDelegate: AnyObject {
    func selectedTemp(сelsiusOrFahrenheit: SettingsUserDefaultsModel)
    func selectedSpeedWind(milesOrKilometers: SettingsUserDefaultsModel)
    func selectedTimeFormat(twelveOrTwentyFour: SettingsUserDefaultsModel)
    func selectedNotifications(onOrOff: SettingsUserDefaultsModel)
    func installSettings()
}

class SettingsView: UIView {
    
    weak var delegate: SettingsViewDelegate?
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ListColors.white.rawValue)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.text = "Настройки"
        return label
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 20
        return stack
    }()
    
    private lazy var tempStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 50
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "Температура"
        return label
    }()
    
    private lazy var tempSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().temperature)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: ListColors.blue.rawValue)
        segmentedControl.backgroundColor = UIColor(named: ListColors.beige.rawValue )
        segmentedControl.addTarget(self, action: #selector(selectedTemp), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var speedWindStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 50
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var speedWindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "Скорость ветра"
        return label
    }()
    
    private lazy var speedWindSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().windSpeed)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: ListColors.blue.rawValue)
        segmentedControl.backgroundColor = UIColor(named: ListColors.beige.rawValue )
        segmentedControl.addTarget(self, action: #selector(selectedSpeedWind), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()
    
    private lazy var timeFormatStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 50
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var timeFormatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "Формат времени"
        return label
    }()
    
    private lazy var timeFormatSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().timeFormat)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: ListColors.blue.rawValue)
        segmentedControl.backgroundColor = UIColor(named: ListColors.beige.rawValue )
        segmentedControl.addTarget(self, action: #selector(selectedTimeFormat), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()
    
    private lazy var notificationsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 50
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var notificationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ListColors.gray.rawValue)
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "Уведомления"
        return label
    }()
    
    private lazy var notificationsSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().notifications)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.selectedSegmentTintColor = UIColor(named: ListColors.blue.rawValue)
        segmentedControl.backgroundColor = UIColor(named: ListColors.beige.rawValue )
        segmentedControl.addTarget(self, action: #selector(selectedNotifications), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
        return segmentedControl
    }()
    
    private lazy var installButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(installSettings), for: .touchUpInside)
        button.setTitle("Установить ", for: .normal)
        button.setTitleColor(UIColor(named: ListColors.beige.rawValue ), for: .normal)
        button.titleLabel?.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: ListColors.orange.rawValue)
        return button
    }()
    
    init(delegate: SettingsViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(named: ListColors.blue.rawValue)
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getIndexSelected(temp: Int, time: Int, speed: Int) {
        self.tempSegmentedControl.selectedSegmentIndex = temp
        self.timeFormatSegmentedControl.selectedSegmentIndex = time
        self.speedWindSegmentedControl.selectedSegmentIndex = speed
    }
    
    private func setupUi() {
        self.addSubview(self.backView)
        self.addSubview(self.titleLabel)
        
        self.addSubview(self.generalStackView)
        self.addSubview(self.installButton)
        
        self.generalStackView.addArrangedSubview(self.tempStackView)
        self.tempStackView.addArrangedSubview(self.tempLabel)
        self.tempStackView.addArrangedSubview(self.tempSegmentedControl)
        
        self.generalStackView.addArrangedSubview(self.speedWindStackView)
        self.speedWindStackView.addArrangedSubview(self.speedWindLabel)
        self.speedWindStackView.addArrangedSubview(self.speedWindSegmentedControl)
        
        self.generalStackView.addArrangedSubview(self.timeFormatStackView)
        self.timeFormatStackView.addArrangedSubview(self.timeFormatLabel)
        self.timeFormatStackView.addArrangedSubview(self.timeFormatSegmentedControl)
        
        self.generalStackView.addArrangedSubview(self.notificationsStackView)
        self.notificationsStackView.addArrangedSubview(self.notificationsLabel)
        self.notificationsStackView.addArrangedSubview(self.notificationsSegmentedControl)
        
        self.backView.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(330)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.width.equalTo(112)
            make.height.equalTo(15)
            make.top.equalTo(self.backView.snp.top).inset(27)
            make.leading.equalTo(self.backView.snp.leading).inset(20)
        }
        
        self.generalStackView.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(57)
            make.leading.equalTo(self.backView.snp.leading).inset(20)
            make.trailing.equalTo(self.backView.snp.trailing).inset(30)
            make.bottom.equalTo(self.backView.snp.bottom).inset(93)
        }
        
        self.tempSegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        self.speedWindSegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        self.timeFormatSegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        self.notificationsSegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        
        self.installButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(self.backView.snp.leading).inset(35)
            make.trailing.equalTo(self.backView.snp.trailing).inset(35)
            make.bottom.equalTo(self.backView.snp.bottom).inset(16)
        }
    }
    
    private func settingsFontSegmentedControl(segmentedControl: UISegmentedControl) {
        
        guard let font = UIFont(name: ListFonts.regular400.rawValue, size: 16) else { return }
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font,
                                                 NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font,
                                                 NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    @objc private func selectedTemp() {
        guard let selected = tempSegmentedControl.titleForSegment(at: tempSegmentedControl.selectedSegmentIndex) else { return }
        
        delegate?.selectedTemp(сelsiusOrFahrenheit: SettingsUserDefaultsModel(indexSelected: tempSegmentedControl.selectedSegmentIndex, value: selected))
    }
    
    @objc private func selectedSpeedWind() {
        guard let selected = speedWindSegmentedControl.titleForSegment(at: speedWindSegmentedControl.selectedSegmentIndex) else { return }
        
        delegate?.selectedSpeedWind(milesOrKilometers: SettingsUserDefaultsModel(indexSelected: speedWindSegmentedControl.selectedSegmentIndex, value: selected))
    }
    
    @objc private func selectedTimeFormat() {
        guard let selected = timeFormatSegmentedControl.titleForSegment(at: timeFormatSegmentedControl.selectedSegmentIndex) else { return }
        
        delegate?.selectedTimeFormat(twelveOrTwentyFour: SettingsUserDefaultsModel(indexSelected: timeFormatSegmentedControl.selectedSegmentIndex, value: selected))
    }
    
    @objc private func selectedNotifications() {
        guard let selected = notificationsSegmentedControl.titleForSegment(at: notificationsSegmentedControl.selectedSegmentIndex) else { return }
        
//        delegate?.selectedNotifications(onOrOff: SettingsUserDefaultsModel(indexSelected: notificationsSegmentedControl.selectedSegmentIndex, value: selected))
        print("selectedTemp", selected)
    }
    
    @objc private func installSettings() {
        delegate?.installSettings()
        print("installSettings")
    }
}
