//
//  StoreKitManager.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/11.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import SwiftyStoreKit

class StoreKitManager{
    static let shared = StoreKitManager()
    
    init() {
    }
    
    var price:String = ""
    var description:String = ""
}
