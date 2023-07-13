
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
    
//    degree - CircleImage, Label - One
    private lazy var circleOneImage: UIImageView = {
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
    
//    degree - CircleImage, Label - Two
    private lazy var circleTwoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
//    degree - CircleImage, Label - Three
    private lazy var circleThreeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()

//    degree - CircleImage, Label - Four
    private lazy var circleFourImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
//    degree - CircleImage, Label - Five
    private lazy var circleFiveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
//    degree - CircleImage, Label - Six
    private lazy var circleSixImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
//    degree - CircleImage, Label - Seven
    private lazy var circleSevenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var degreeLabelSeven: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "13°"
        return label
    }()
    
    
//    precipitation Stack, Image, Label, divisionLineView, TimeLabel - One
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
    
    private lazy var precipitationTimeLabelOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()
    
//    precipitation Stack, Image, Label, divisionLineView, TimeLabel - Two
    private lazy var precipitationStackViewTwo: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewTwo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewTwo: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()

//    precipitation Stack, Image, Label, divisionLineView, TimeLabel - Three
    private lazy var precipitationStackViewThree: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewThree: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewThree: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()
    
//    precipitation Stack, Image, Label, divisionLineView, TimeLabel - Four
    private lazy var precipitationStackViewFour: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewFour: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewFour: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()

//    precipitation Image, Label, divisionLineView, TimeLabel - Five
    private lazy var precipitationStackViewFive: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewFive: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewFive: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()

//    precipitation Image, Label, divisionLineView, TimeLabel - Six
    private lazy var precipitationStackViewSix: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewSix: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewSix: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelSix: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
    }()

//    precipitation Image, Label, divisionLineView, TimeLabel - seven
    private lazy var precipitationStackViewSeven: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }()

    private lazy var precipitationImageViewSeven: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "precipitationImage")
        return image
    }()

    private lazy var precipitationLabelSeven: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "47%"
        return label
    }()

    private lazy var divisionLineViewSeven: UIView = {
        let line = UIView()
        line.layer.borderWidth = 4
        line.layer.borderColor = UIColor(named: "figmaColorBlue")?.cgColor
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        line.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return line
    }()

    private lazy var precipitationTimeLabelSeven: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.textColor = .black
        label.text = "12:00"
        return label
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
        self.addSubview(self.timeLineView)
        
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
        
        self.addSubview(self.precipitationStackViewOne)
        self.precipitationStackViewOne.addArrangedSubview(self.precipitationImageViewOne)
        self.precipitationStackViewOne.addArrangedSubview(self.precipitationLabelOne)
        self.precipitationStackViewOne.addArrangedSubview(self.divisionLineViewOne)
        self.precipitationStackViewOne.addArrangedSubview(self.precipitationTimeLabelOne)
        
        self.addSubview(self.precipitationStackViewTwo)
        self.precipitationStackViewTwo.addArrangedSubview(self.precipitationImageViewTwo)
        self.precipitationStackViewTwo.addArrangedSubview(self.precipitationLabelTwo)
        self.precipitationStackViewTwo.addArrangedSubview(self.divisionLineViewTwo)
        self.precipitationStackViewTwo.addArrangedSubview(self.precipitationTimeLabelTwo)

        self.addSubview(self.precipitationStackViewThree)
        self.precipitationStackViewThree.addArrangedSubview(self.precipitationImageViewThree)
        self.precipitationStackViewThree.addArrangedSubview(self.precipitationLabelThree)
        self.precipitationStackViewThree.addArrangedSubview(self.divisionLineViewThree)
        self.precipitationStackViewThree.addArrangedSubview(self.precipitationTimeLabelThree)

        self.addSubview(self.precipitationStackViewFour)
        self.precipitationStackViewFour.addArrangedSubview(self.precipitationImageViewFour)
        self.precipitationStackViewFour.addArrangedSubview(self.precipitationLabelFour)
        self.precipitationStackViewFour.addArrangedSubview(self.divisionLineViewFour)
        self.precipitationStackViewFour.addArrangedSubview(self.precipitationTimeLabelFour)

        self.addSubview(self.precipitationStackViewFive)
        self.precipitationStackViewFive.addArrangedSubview(self.precipitationImageViewFive)
        self.precipitationStackViewFive.addArrangedSubview(self.precipitationLabelFive)
        self.precipitationStackViewFive.addArrangedSubview(self.divisionLineViewFive)
        self.precipitationStackViewFive.addArrangedSubview(self.precipitationTimeLabelFive)

        self.addSubview(self.precipitationStackViewSix)
        self.precipitationStackViewSix.addArrangedSubview(self.precipitationImageViewSix)
        self.precipitationStackViewSix.addArrangedSubview(self.precipitationLabelSix)
        self.precipitationStackViewSix.addArrangedSubview(self.divisionLineViewSix)
        self.precipitationStackViewSix.addArrangedSubview(self.precipitationTimeLabelSix)

        self.addSubview(self.precipitationStackViewSeven)
        self.precipitationStackViewSeven.addArrangedSubview(self.precipitationImageViewSeven)
        self.precipitationStackViewSeven.addArrangedSubview(self.precipitationLabelSeven)
        self.precipitationStackViewSeven.addArrangedSubview(self.divisionLineViewSeven)
        self.precipitationStackViewSeven.addArrangedSubview(self.precipitationTimeLabelSeven)
        
        
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
        
        // precipitation Image, Label, divisionLineView, TimeLabel - one
        self.divisionLineViewOne.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[0])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - two
        self.divisionLineViewTwo.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[1])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - three
        self.divisionLineViewThree.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[2])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - Four
        self.divisionLineViewFour.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[3])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - Five
        self.divisionLineViewFive.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[4])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - Six
        self.divisionLineViewSix.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[5])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
        
        // precipitation Image, Label, divisionLineView, TimeLabel - Seven
        self.divisionLineViewSeven.snp.makeConstraints { make in
            make.leading.equalTo(self.backView.snp.leading).inset(array[6])
            make.bottom.equalTo(self.backView.snp.bottom).inset(32)
        }
    }



    private func linePoint() -> [CGFloat] {
        
        let indentFirstPoint: CGFloat = 24
        var array:[CGFloat] = [indentFirstPoint]
        let wightScreen = UIScreen.main.bounds.width
        let countPoint = wightScreen / 7

        for index in 1...6 {
            let value = CGFloat(index) * countPoint
            array.append(value+indentFirstPoint)
        }

        return array
    }
    
    func setupForecast() {
    // переписать высоту для кружочков
//        circleOneImage.snp.makeConstraints { make in
//            make.top.equalTo(self.backView.snp.top).inset(27)   --- min
//            make.top.equalTo(self.backView.snp.top).inset(45)   --- max
//        }
    
//        degreeLabelOne.text
//        precipitationLabelOne.text
//        precipitationTimeLabelOne.text
        
//        degreeLabelTwo.text
//        precipitationLabelTwo.text
//        precipitationTimeLabelTwo.text

//        degreeLabelThree.text
//        precipitationLabelThree.text
//        precipitationTimeLabelThree.text

//        degreeLabelFour.text
//        precipitationLabelFour.text
//        precipitationTimeLabelFour.text

//        degreeLabelFive.text
//        precipitationLabelFive.text
//        precipitationTimeLabelFive.text

//        degreeLabelSix.text
//        precipitationLabelSix.text
//        precipitationTimeLabelSix.text
        
//        degreeLabelSeven.text
//        precipitationLabelSeven.text
//        precipitationTimeLabelSeven.text

    }
}


