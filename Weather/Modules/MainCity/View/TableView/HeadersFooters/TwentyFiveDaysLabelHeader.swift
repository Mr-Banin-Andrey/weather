
import Foundation
import UIKit
import SnapKit


class TwentyFiveDaysLabelHeader: UITableViewHeaderFooterView {
    
    private lazy var nameDailyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        label.text = "Ежедневный прогноз"
        return label
    }()
    
    private lazy var twentyFiveDaysButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        button.setAttributedTitle("25 дней".underLined, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showTwentyFiveDays), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        self.addSubview(self.nameDailyForecastLabel)
        self.addSubview(self.twentyFiveDaysButton)
        
        self.nameDailyForecastLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
        self.twentyFiveDaysButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
    }
    
    @objc private func showTwentyFiveDays() {
        
    }
}
