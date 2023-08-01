
import Foundation
import UIKit
import SnapKit

protocol RootViewProtocol: AnyObject {
    func showSettings()
    func showPermissionToUseLocation()
}

class RootView: UIView {
    
    weak var delegate: RootViewProtocol?
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "бургер"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 34).isActive = true
        button.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "месторасположение"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(showPermissionToUseLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ListFonts.medium500.rawValue, size: 18)
        label.textColor = .black
        return label
    }()
    
    init(delegate: RootViewProtocol) {
        self.delegate = delegate
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationController(navigationItem: UINavigationItem, navigationController: UINavigationController, title: String) {
        
        self.titleLabel.text = title
        navigationItem.titleView = titleLabel
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        let barCustomRightButtom = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItems = [barCustomRightButtom]
        navigationItem.rightBarButtonItem = barCustomRightButtom

        let barCustomLeftButtom = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItems = [barCustomLeftButtom]
        navigationItem.leftBarButtonItem = barCustomLeftButtom
    }
    
    @objc private func showSettings() {
        delegate?.showSettings()
    }
    
    @objc private func showPermissionToUseLocation() {
        delegate?.showPermissionToUseLocation()
    }
    
}
