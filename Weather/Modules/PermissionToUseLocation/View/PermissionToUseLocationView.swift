

import Foundation

protocol PermissionToUseLocationProtocol: AnyObject {
    func giveAccessToTheLocation()
    func doNotGiveAccessToTheLocation()
}

class PermissionToUseLocationView {
    
    weak var delegate: PermissionToUseLocationProtocol?
    
}
