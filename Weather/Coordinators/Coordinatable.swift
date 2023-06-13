
import UIKit

protocol Coordinatable: AnyObject {
    var child: [Coordinatable] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
