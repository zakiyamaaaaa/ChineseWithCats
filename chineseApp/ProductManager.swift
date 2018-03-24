//
//  ProductManager.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/11.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import StoreKit

class ProductManager:NSObject{
    static var share = ProductManager()
    
    var request:SKProductsRequest!
    @objc dynamic var products:[SKProduct]!
    
    func validateProductsIdentifiers(productID:[String]){
        self.request = SKProductsRequest(productIdentifiers: Set<String>(productID))
        request.delegate = self
        request.start()
    }
}

extension ProductManager:SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for id in response.invalidProductIdentifiers{
            print(id)
        }
    }
}
