

import Foundation
import UIKit


struct CustomImageView {
    func editColorImageView(color: UIColor, imageView: UIImageView) { 
        if let image = imageView.image {
            let imageRendering = image.withRenderingMode(.alwaysTemplate)
            imageView.image = imageRendering
            imageView.tintColor = color
        }
    }
}
