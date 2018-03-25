//
//  UIImage+ColorSet.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2018/03/25.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func offColor() -> UIColor {
        return UIColor.gray
    }

    class func mainColor() -> UIColor {
        return self.rgb(r: 233, g: 61, b: 67, alpha: 1)
    }
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
}
