
import Foundation
import UIKit
import SnapKit

class HourlyWeatherCellInTableViewCell: UICollectionViewCell {
    
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: ListColors.blue.rawValue)?.cgColor
        return view
    }()
    
    private lazy var clockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 14)
        label.text = "09:41"
        label.textColor = .black
        return label
    }()
    
    private lazy var pictureWeatherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame-5")
        return image
    }()
    
    private lazy var gradusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: ListFonts.regular400.rawValue, size: 16)
        label.text = "23°"
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
    
    private func setupConstraints() {
        self.contentView.addSubview(self.backView)
        self.contentView.addSubview(self.clockLabel)
        self.contentView.addSubview(self.pictureWeatherImage)
        self.contentView.addSubview(self.gradusLabel)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(84)
            make.width.equalTo(42)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.clockLabel.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(15)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.pictureWeatherImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
        
        self.gradusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).inset(8)
            make.centerX.equalTo(self.backView.snp.centerX)
        }
    }
    
}
