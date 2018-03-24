//
//  RoundedRectButton.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/01.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedRectButton: UIButton {
    
    @IBInspectable var textColor: UIColor?
    
    @IBInspectable var cornerRadius: CGFloat = 20 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.darkGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

}
