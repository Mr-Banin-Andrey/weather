

import UIKit

protocol ViewModelProtocol: AnyObject {}

struct Module {
    let viewModel: ViewModelProtocol
    let view: UIViewController
}
