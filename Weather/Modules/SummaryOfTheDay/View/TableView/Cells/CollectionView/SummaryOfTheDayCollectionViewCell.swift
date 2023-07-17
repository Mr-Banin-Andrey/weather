
import Foundation
import UIKit
import SnapKit

class SummaryOfTheDayCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
//        view.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
//        view.backgroundColor = UIColor(named: ListColors.blue.rawValue)
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 18)
        label.text = "16/04 ПТ"
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setup() {
//        backView.backgroundColor = UIColor(named: ListColors.blue.rawValue)
//        clockLabel.textColor = .white
//        gradusLabel.textColor = .white
//    }
    
    func setupSelect() {
        self.backView.backgroundColor = UIColor(named: ListColors.blue.rawValue)
        self.dateLabel.textColor = .white
    }
    
    func setupDeselect() {
        self.backView.backgroundColor = nil
        self.dateLabel.textColor = .black
    }
    
    
    private func setupConstraints() {
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.dateLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(88)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.backView.snp.centerX)
            make.centerY.equalTo(self.backView.snp.centerY)
        }
    }
    
}
