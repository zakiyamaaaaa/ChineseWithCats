//
//  AlertController+Image.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2018/03/25.
//  Copyright © 2018年 shoichiyamazaki. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func addImage(image: UIImage) {
        let maxSize = CGSize(width: 245, height: 300)
        let imgSize = image.size
        
        var ratio : CGFloat
        if (imgSize.width > imgSize.height) {
            ratio = maxSize.width/imgSize.width
        } else {
            ratio = maxSize.height/imgSize.height
        }
        
        let scaledSize = CGSize(width: imgSize.width*ratio, height: imgSize.height*ratio)
        
        var resizedImage = image.imageWithSize(scaledSize)
        
        if imgSize.height > imgSize.width {
            let left = (maxSize.width - resizedImage.size.width)/2
            resizedImage = resizedImage.withAlignmentRectInsets(UIEdgeInsetsMake(0, -left, 0, 0))
        }
        
        let imageAction = UIAlertAction(title: "", style: .default, handler: nil)
        imageAction.isEnabled = false
        imageAction.setValue(resizedImage.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imageAction)
    }
}

