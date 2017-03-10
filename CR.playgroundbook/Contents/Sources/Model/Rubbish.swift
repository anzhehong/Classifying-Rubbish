

import Foundation
import UIKit

public enum RubbishCategory {
    case plastic
    case metal
    case paper
    case poisonous
    case others
}

public class Rubbish: NSObject {
    public var name = "NO NAME"
    public var category: RubbishCategory = .others
    public var image: UIImage!
    
    public init(name nameValue: String, category categoryValue: RubbishCategory, image imageToUse: UIImage) {
        super.init()
        name = nameValue
        category = categoryValue
        image = imageToUse
    }
}
