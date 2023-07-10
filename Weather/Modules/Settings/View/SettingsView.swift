

import Foundation
import UIKit
import SnapKit

protocol SettingsViewDelegate: AnyObject {
    
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
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.alignment = .center
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
        
        self.backView.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(320)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.width.equalTo(112)
            make.height.equalTo(15)
            make.top.equalTo(self.backView.snp.top).inset(27)
            make.leading.equalTo(self.backView.snp.leading).inset(20)
        }
    }
}
