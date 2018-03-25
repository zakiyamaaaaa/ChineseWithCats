//
//  UIImage+Resize.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2018/03/25.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageWithSize(_ size:CGSize) -> UIImage {
        
        var scaledImageRect = CGRect.zero
        let aspectWidth = size.width/self.size.width
        let aspectHeight = size.height/self.size.height
        let aspectRatio = min(aspectWidth,aspectHeight)
        
        scaledImageRect.size.width = self.size.width*aspectRatio
        scaledImageRect.size.height = self.size.height*aspectRatio
        scaledImageRect.origin.x = (size.width - scaledImageRect.size.width)/2.0
        scaledImageRect.origin.y = (size.height - scaledImageRect.size.height)/2.0
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        self.draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return scaledImage!
    }
    
}
