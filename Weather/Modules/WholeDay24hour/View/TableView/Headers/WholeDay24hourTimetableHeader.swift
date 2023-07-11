
import Foundation
import UIKit
import SnapKit

class WholeDay24hourTimetableHeader: UITableViewHeaderFooterView {
    /// между кружками 56 поинтов, общие кол-во кружков 7, показывает каждые 3 часа
    /// высота линии графика 18 поинтов - можно сдвигать на 3 поинта вверх или вниз, в зависимости от температуры
    /// придумать функцию которая будет изменять констрейнты по погоде
    /// ??? как перемещать блюр
    
    private let customImageView = CustomImageView()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "figmaColorWhite")
        return view
    }()
    
    private lazy var dottedLineImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Vector4")
        customImageView.editColorImageView(color: UIColor.blue, imageView: image)
        return image
    }()
    
    private lazy var circleOneImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var lineViewOne: UIView = {
        let line = UIView()
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor.blue.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var circleTwoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var inters = DashedView()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        self.addSubview(self.backView)
//        self.addSubview(self.dottedLineImage)
        self.addSubview(self.circleOneImage)
        self.addSubview(self.circleTwoImage)
        
//        self.addSubview(self.lineViewOne)
        self.addSubview(self.inters)
        
//        inters.config.color = .blue
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(152)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.inters.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(self.backView.snp.top).inset(31)
            make.leading.equalTo(self.backView.snp.leading).inset(16)
            make.trailing.equalTo(self.backView.snp.trailing).inset(15)
        }
        
        self.circleOneImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(27)
            make.leading.equalTo(self.backView.snp.leading).inset(16)
            
        }
        
        self.circleTwoImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(33)
            make.leading.equalTo(self.backView.snp.leading).inset(62)
        }
        
//        self.lineViewOne.snp.makeConstraints { make in
//            make.height.equalTo(1)
//            make.top.equalTo(self.backView.snp.top).inset(30)
//            make.leading.equalTo(self.circleOneImage.snp.trailing)
//            make.trailing.equalTo(self.circleTwoImage.snp.leading)
//        }
    }
}
