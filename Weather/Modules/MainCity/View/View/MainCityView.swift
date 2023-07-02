
import Foundation
import UIKit


protocol MainCityViewDelegate: AnyObject {
    func showSettingsView()
    func showPermissionToUseLocationView()
}

class MainCityView: UIView {
    
    private weak var delegate: MainCityViewDelegate?
    
    
    
    init(delegate: MainCityViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigationController(
        navItem: UINavigationItem
//        navTitle: String
//        leftButton: UIBarButtonItem,
//        rightButton: UIBarButtonItem
    ) {
        
        let leftButton = UIBarButtonItem(
            image: UIImage(named: "бургер"),
            style: .done,
            target: self,
            action: #selector(showSettings)
        )
        
        let rightButton = UIBarButtonItem(
            image: UIImage(named: "месторасположение"),
            style: .done,
            target: self,
            action: #selector(showSettings)
        )
        
        let titleView = "то что передам"
        
//        guard let font = UIFont(name: "Rubik-Light_Medium", size: 18) else { return }
        
//        UINavigationBar.appearance().titleTextAttributes = [
//            .foregroundColor: UIColor.white,
//            .font: font
//        ]
        
    
        
        navItem.title = titleView
        navItem.rightBarButtonItems = [rightButton]
        navItem.rightBarButtonItem = rightButton
        
        navItem.leftBarButtonItems = [leftButton]
        navItem.leftBarButtonItem = leftButton
    }
    
    @objc private func showSettings() {
        delegate?.showSettingsView()
    }
    
    @objc private func showPermissionToUseLocation() {
        delegate?.showPermissionToUseLocationView()
    }
}
