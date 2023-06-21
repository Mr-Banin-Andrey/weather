

import Foundation
import UIKit

class PermissionToUseLocationViewController: UIViewController {
    
    private lazy var permissionToUseLocationView = PermissionToUseLocationView(delegate: self)
 
    
    override func loadView() {
        super.loadView()
        
        view = permissionToUseLocationView
        
        self.permissionToUseLocationView.setupText(text: TextTitle().textTitle[0])
    }
    
    
}

extension PermissionToUseLocationViewController: PermissionToUseLocationDelegate {
    
    func giveAccessToTheLocation() {
        print("🍋 give")
    }
    
    func doNotGiveAccessToTheLocation() {
        print("do not give ❌")
    }
    
    
}
