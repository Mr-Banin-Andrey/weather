

import Foundation
import UIKit
import SnapKit

protocol SettingsViewDelegate: AnyObject {
    func selectedTemp()
    func selectedSpeedWind()
    func selectedTimeFormat()
    func selectedNotifications()
    func installSettings()
}

class SettingsView: UIView {
    
    weak var delegate: SettingsViewDelegate?
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "figmaColorWhite")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Rubik-Light_Medium", size: 18)
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
        label.textColor = #colorLiteral(red: 0.587769568, green: 0.5679551959, blue: 0.5726220608, alpha: 1)
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.text = "Температура"
        return label
    }()
    
    private lazy var tempSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().temperature)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: "figmaColorBlue")
        segmentedControl.backgroundColor = UIColor(named: "figmaColorBeige")
        segmentedControl.addTarget(self, action: #selector(selectedTemp), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
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
        label.textColor = #colorLiteral(red: 0.587769568, green: 0.5679551959, blue: 0.5726220608, alpha: 1)
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.text = "Скорость ветра"
        return label
    }()
    
    private lazy var speedWindSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().windSpeed)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: "figmaColorBlue")
        segmentedControl.backgroundColor = UIColor(named: "figmaColorBeige")
        segmentedControl.addTarget(self, action: #selector(selectedSpeedWind), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
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
        label.textColor = #colorLiteral(red: 0.587769568, green: 0.5679551959, blue: 0.5726220608, alpha: 1)
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.text = "Формат времени"
        return label
    }()
    
    private lazy var timeFormatSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().timeFormat)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = UIColor(named: "figmaColorBlue")
        segmentedControl.backgroundColor = UIColor(named: "figmaColorBeige")
        segmentedControl.addTarget(self, action: #selector(selectedTimeFormat), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
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
        label.textColor = #colorLiteral(red: 0.587769568, green: 0.5679551959, blue: 0.5726220608, alpha: 1)
        label.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        label.text = "Уведомления"
        return label
    }()
    
    private lazy var notificationsSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: SettingsModel().notifications)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.selectedSegmentTintColor = UIColor(named: "figmaColorBlue")
        segmentedControl.backgroundColor = UIColor(named: "figmaColorBeige")
        segmentedControl.addTarget(self, action: #selector(selectedNotifications), for: .valueChanged)
        settingsFontSegmentedControl(segmentedControl: segmentedControl)
        return segmentedControl
    }()
    
    private lazy var installButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(installSettings), for: .touchUpInside)
        button.setTitle("Установить ", for: .normal)
        button.setTitleColor(UIColor(named: "figmaColorBeige"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "figmaColorOrange")
        return button
    }()
    
    init(delegate: SettingsViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(named: "figmaColorBlue")
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        guard let font = UIFont(name: "Rubik-Light_Regular", size: 16) else { return }
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font,
                                                 NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font,
                                                 NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    @objc private func selectedTemp() {
        delegate?.selectedTemp()
        let selected = tempSegmentedControl.titleForSegment(at: tempSegmentedControl.selectedSegmentIndex)
        print("selectedTemp", selected!)
    }
    
    @objc private func selectedSpeedWind() {
        delegate?.selectedSpeedWind()
        let selected = speedWindSegmentedControl.titleForSegment(at: speedWindSegmentedControl.selectedSegmentIndex)
        print("selectedSpeedWind", selected!)
    }
    
    @objc private func selectedTimeFormat() {
        delegate?.selectedTimeFormat()
        let selected = timeFormatSegmentedControl.titleForSegment(at: timeFormatSegmentedControl.selectedSegmentIndex)
        print("selectedTimeFormat", selected!)
    }
    
    @objc private func selectedNotifications() {
        delegate?.selectedNotifications()
        let selected = notificationsSegmentedControl.titleForSegment(at: notificationsSegmentedControl.selectedSegmentIndex)
        print("selectedTemp", selected!)
    }
    
    @objc private func installSettings() {
        delegate?.installSettings()
        print("installSettings")
    }
}
