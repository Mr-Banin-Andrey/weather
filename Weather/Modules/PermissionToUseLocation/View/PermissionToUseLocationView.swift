

import Foundation
import UIKit
import SnapKit

protocol PermissionToUseLocationDelegate: AnyObject {
    func giveAccessToTheLocation()
    func doNotGiveAccessToTheLocation()
}

final class PermissionToUseLocationView: UIView {
    
    weak var delegate: PermissionToUseLocationDelegate?
    
    private lazy var pictureImageView: UIImageView = {
        let pictures = UIImageView()
        pictures.translatesAutoresizingMaskIntoConstraints = false
        pictures.image = UIImage(named: "Frame54")
        return pictures
    }()
    
    private lazy var firstParagraphLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont(name: "Rubik-Light_SemiBold", size: 16)
        label.textColor = UIColor(named: "figmaColorBeige")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondParagraphLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "figmaColorBeige")
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdParagraphLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "figmaColorBeige")
        label.font = UIFont(name: "Rubik-Light_Regular", size: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var agreeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "figmaColorOrange")
        button.setTitle(" ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА ", for: .normal)
        button.setTitleColor(UIColor(named: "figmaColorBeige"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Light_Medium", size: 12)
        button.addTarget(self, action: #selector(agreeUseLocation), for: .touchUpInside)
        return button
    }()
    
    private lazy var refuseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.setTitleColor(UIColor(named: "figmaColorBeige"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Light_Regular", size: 16)
        button.addTarget(self, action: #selector(refuseUseLocation), for: .touchUpInside)
        return button
    }()
    
    init(delegate: PermissionToUseLocationDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = UIColor(named: "figmaColorBlue")
        
        self.setupUi()
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
////            if family == "Rubik" {
//                print("Family: \(family), names: \(names)")
////            }
//
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        self.addSubview(self.pictureImageView)
        self.addSubview(self.firstParagraphLabel)
        self.addSubview(self.secondParagraphLabel)
        self.addSubview(self.thirdParagraphLabel)
        self.addSubview(self.agreeButton)
        self.addSubview(self.refuseButton)
        
        self.pictureImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.centerX.equalTo(self.snp.centerX).inset(24)
            make.height.equalTo(196)
            make.width.equalTo(180)
        }
        
        self.firstParagraphLabel.snp.makeConstraints { make in
            make.top.equalTo(self.pictureImageView.snp.bottom).offset(56)
            make.centerX.equalTo(self.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        self.secondParagraphLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstParagraphLabel.snp.bottom).offset(56)
            make.centerX.equalTo(self.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        self.thirdParagraphLabel.snp.makeConstraints { make in
            make.top.equalTo(self.secondParagraphLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        self.agreeButton.snp.makeConstraints { make in
            make.top.equalTo(self.thirdParagraphLabel.snp.bottom).offset(40)
            make.centerX.equalTo(self.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        self.refuseButton.snp.makeConstraints { make in
            make.top.equalTo(self.agreeButton.snp.bottom).offset(24)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setupText(text: PermissionToUseLocationModel) {
        self.firstParagraphLabel.text = text.firstParagraph
        self.secondParagraphLabel.text = text.secondParagraph
        self.thirdParagraphLabel.text = text.thirdParagraph
    }
    
    @objc private func agreeUseLocation() {
        delegate?.giveAccessToTheLocation()
    }
    
    @objc private func refuseUseLocation() {
        delegate?.doNotGiveAccessToTheLocation()
    }
}
