

import Foundation
import UIKit

struct CustomView {
    var gradusImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "GRADUS")
        return image
    }()
}
