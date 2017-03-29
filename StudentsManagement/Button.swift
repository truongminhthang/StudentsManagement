//
//  Button.swift
//  Register
//
//  Created by Trương Thắng on 3/24/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    @IBInspectable
    
    var titleMultiline: Bool = false {
        didSet {
            self.titleLabel?.numberOfLines = 0
        }
    }
    
    @IBInspectable
    var titleAlignment: Int = 0 {
        didSet {
            if let alignment = NSTextAlignment(rawValue: titleAlignment) {
                self.titleLabel?.textAlignment = alignment
            }
        }
    }
    
    @IBInspectable
    var borderWidth: Float = 0 {
        didSet {
            self.layer.borderWidth = CGFloat(borderWidth)
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius == -1 {
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                self.layer.cornerRadius = cornerRadius
            }
            self.clipsToBounds = true
        }
    }
    
    @IBInspectable var disableColor : UIColor = UIColor.darkGray {
        didSet {
            self.setBackgroundImage(UIImage(color: disableColor ), for: .disabled)
        }
    }
    
    @IBInspectable var enableColor : UIColor  = UIColor.white {
        didSet {
            self.setBackgroundImage(UIImage(color: enableColor), for: .normal)
        }
    }
}

extension UIImage {
    convenience init?(color: UIColor) {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
