//
//  NetworkActivityIndicatorManager.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/13.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import UIKit

class NetworkActivityIndicatorManager:NSObject{
    
    private static var loadingCount = 0
    
    class func NetworkOperationStarted(){
        if loadingCount == 0{
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
    }
    
    class func networkOperationFinished(){
        if loadingCount > 0{
            loadingCount -= 1
        }
        
        if loadingCount == 0{
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
