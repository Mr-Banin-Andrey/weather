
import Foundation
import UIKit
import SnapKit

class WholeDay24hourTimetableHeader: UITableViewHeaderFooterView {
    // между кружками 56 поинтов, общие кол-во кружков 7, показывает каждые 3 часа
    // высота линии графика 18 поинтов - сдвиг 3 поинта
        
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "figmaColorWhite")
        return view
    }()
    
    private lazy var lineHorizontal: DashedViewHorizontal = {
        let view = DashedViewHorizontal()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: "figmaColorBlue") ?? .black
        return view
    }()
    
    private lazy var lineVertical: DashedViewVertical = {
        let view = DashedViewVertical()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.config.color = UIColor(named: "figmaColorBlue") ?? .black
        return view
    }()
    
    private lazy var timeLineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var circleOneImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleTwoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleThreeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleFourImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleFiveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleSixImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var circleSevenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
    private lazy var degreeLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12°"
        return label
    }()

    private lazy var degreeLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "11°"
        return label
    }()

    private lazy var degreeLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "10°"
        return label
    }()

    private lazy var degreeLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "8°"
        return label
    }()
    private lazy var degreeLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "7°"
        return label
    }()
    private lazy var degreeLabelSeven: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "6°"
        return label
    }()
    
//    private lazy var
    
    private lazy var precipitationStackViewOne: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()
    
    private lazy var precipitationImageViewOne: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()
    
    private lazy var precipitationLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()
    
    
    private lazy var divisionLineViewOne: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUi()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
       
        let array = linePoint()
        
        self.addSubview(self.backView)
        self.addSubview(self.lineVertical)
        self.addSubview(self.lineHorizontal)
        
        self.addSubview(self.circleOneImage)
        self.addSubview(self.circleTwoImage)
        self.addSubview(self.circleThreeImage)
        self.addSubview(self.circleFourImage)
        self.addSubview(self.circleFiveImage)
        self.addSubview(self.circleSixImage)
        self.addSubview(self.circleSevenImage)
        
        self.addSubview(self.degreeLabelOne)
        self.addSubview(self.degreeLabelTwo)
        self.addSubview(self.degreeLabelThree)
        self.addSubview(self.degreeLabelFour)
        self.addSubview(self.degreeLabelFive)
        self.addSubview(self.degreeLabelSix)
        self.addSubview(self.degreeLabelSeven)

        self.addSubview(self.timeLineView)
        
        self.addSubview(self.precipitationStackViewOne)
        self.precipitationStackViewOne.addArrangedSubview(self.precipitationImageViewOne)
        self.precipitationStackViewOne.addArrangedSubview(self.precipitationLabelOne)
        self.precipitationStackViewOne.addArrangedSubview(self.divisionLineViewOne)
//        self.addSubview(self.divisionLineViewOne)
        
        self.backView.snp.makeConstraints { make in
            make.height.equalTo(152)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.lineVertical.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(self.backView.snp.top).inset(31)
            make.leading.equalTo(self.backView.snp.leading).inset(16)
        }
        
        self.lineHorizontal.snp.makeConstraints { make in
            make.top.equalTo(self.backView.snp.top).inset(54)
            make.leading.equalTo(self.backView.snp.leading).inset(16)
            make.trailing.equalTo(self.backView.snp.trailing).inset(16)
        }
        
        self.timeLineView.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(18)
            make.trailing.equalTo(self.backView.snp.trailing).inset(18)
            make.bottom.equalTo(self.backView.snp.bottom).inset(36)
            make.height.equalTo(1)
        }
        // circle and gradus One
        self.circleOneImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(27)
            make.leading.equalTo(self.backView.snp.leading).inset(array[0])
        }
        self.degreeLabelOne.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleOneImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[0])
        }
        // circle and gradus Two
        self.circleTwoImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(30)
            make.leading.equalTo(self.backView.snp.leading).inset(array[1])
        }
        self.degreeLabelTwo.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleTwoImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[1])
        }
        // circle and gradus Three
        self.circleThreeImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(33)
            make.leading.equalTo(self.backView.snp.leading).inset(array[2])
        }
        self.degreeLabelThree.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleThreeImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[2])
        }
        // circle and gradus Four
        self.circleFourImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(36)
            make.leading.equalTo(self.backView.snp.leading).inset(array[3])
        }
        self.degreeLabelFour.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleFourImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[3])
        }
        // circle and gradus Five
        self.circleFiveImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(39)
            make.leading.equalTo(self.backView.snp.leading).inset(array[4])
        }
        self.degreeLabelFive.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleFiveImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[4])
        }
        // circle and gradus Six
        self.circleSixImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(42)
            make.leading.equalTo(self.backView.snp.leading).inset(array[5])
        }
        self.degreeLabelSix.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleSixImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[5])
        }
        // circle and gradus Seven
        self.circleSevenImage.snp.makeConstraints { make in
            make.height.equalTo(8)
            make.width.equalTo(8)
            make.top.equalTo(self.backView.snp.top).inset(45)
            make.leading.equalTo(self.backView.snp.leading).inset(array[6])
        }
        self.degreeLabelSeven.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleSevenImage.snp.top)
            make.leading.equalTo(self.backView.snp.leading).inset(array[6])
        }
        
        
        
        self.divisionLineViewOne.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[0])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        
    }
    
    private func linePoint() -> [CGFloat] {
        
        var array:[CGFloat] = [20]
        let wight = UIScreen.main.bounds.width
        let countPoint = wight / 7

        for index in 1...6 {
            let value = CGFloat(index) * countPoint
            
            array.append(value+20)
        }

        return array
    }
}


