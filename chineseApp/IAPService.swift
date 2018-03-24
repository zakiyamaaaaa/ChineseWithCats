//
//  IAPService.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/11.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import StoreKit

class IAPService:NSObject{
    private override init() {    }
    static let shared = IAPService()
    let secret = "c8a737031b01475cab3bf647d7ae4ce3"
    
    
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    
    func getProducts(){
        let products:Set = [IAPProduct.nonConcumeblae.rawValue]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        paymentQueue.add(self)
    }
    
    func purchase(product:IAPProduct){
        guard let productToPurchase = products.filter({ $0.productIdentifier == product.rawValue}).first else { return }
        let payment = SKPayment(product: productToPurchase)
        paymentQueue.add(payment)
    }
}

extension IAPService:SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        self.products = response.products
        
        for product in response.products{
            print(product.localizedTitle)
        }
    }
}


extension IAPService:SKPaymentTransactionObserver{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            print(transaction.transactionState)
            print(transaction.transactionState.status(),transaction.payment.productIdentifier)
        }
    }
}

extension SKPaymentTransactionState{
    func status()->String{
        switch self {
        case .deferred: return "deferred"
        case .failed: return "failed"
        case .purchased: return "purchased"
        case .purchasing: return "purchasing"
        case .restored: return "restored"
        }
    }
}


