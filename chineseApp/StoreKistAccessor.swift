//
//  StoreKistAccessor.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/11.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import StoreKit

class StoreKitAccessor:NSObject,SKProductsRequestDelegate,SKPaymentTransactionObserver{
    
    static func canMakePayments()->Bool{
        return SKPaymentQueue.canMakePayments()
    }
    
    static func priceForProduct(product:SKProduct)->String{
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product.priceLocale
        return numberFormatter.string(from: product.price)!
    }
    
    static let shared = StoreKitAccessor()
    
    private var cacheProducts:[String:SKProduct] = [String:SKProduct]()
    
    private var getProductionCallback:((SKProduct?)->())?

    private var buyProductionCallback:((String?) -> ())?

    
    func cacheProducts(productIdentifiers:[String]){
        let productsRequest = SKProductsRequest(productIdentifiers: Set(productIdentifiers))
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func getCacheProduct(productIdentifier:String)->SKProduct?{
        return self.cacheProducts[productIdentifier]
    }
    
    func getProduct(productIdentifier:String,callback:@escaping (SKProduct?)->()){
        self.getProductionCallback = callback
        let productsResult = SKProductsRequest(productIdentifiers: Set([productIdentifier]))
        productsResult.delegate = self
        productsResult.start()
    }
    
    func productsRequest(_ request:SKProductsRequest, didReceive response:SKProductsResponse){
        for product in response.products{
            self.cacheProducts[product.productIdentifier] = product
            self.getProductionCallback?(product)
        }
        
        self.getProductionCallback = nil
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        // TODO Crashlyticsなどにエラーログを飛ばす。
        
        // コールバックが記載されていた場合はコールバックを返す。
        self.getProductionCallback?(nil)
        self.getProductionCallback = nil
    }
    
    // 商品情報取得終了処理
    func requestDidFinish(_ request: SKRequest) {
        // 商品情報取得終了時に行いたいことがあればこちらで対応する。
    }
    
    /***
     * 商品購入関連の処理
     */
    
    // 購入処理
    // 本メソッドの処理中は画面ロックされていることを想定しており、複数同時に本メソッドが呼び出されることは想定してない。
    // ※リストア処理と同じコールバックを使っているので注意！
    func buy(product:SKProduct, callback:@escaping (String?) -> ()) {
        self.buyProductionCallback = callback
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(SKPayment(product: product))
        
        // 複数の購入処理を同時に行うこともできるが、使い方が想定できない。
        //        for product in products {
        //            SKPaymentQueue.default().add(SKPayment(product: product))
        //        }
    }
    
    // 購入した商品をリストアする。
    // 本メソッドの処理中は画面ロックされていることを想定しており、複数同時に本メソッドが呼び出されることは想定してない。
    // ※購入処理と同じコールバックを使っているので注意！
    func restoreProducts(callback:@escaping (String?) -> ()) {
        self.buyProductionCallback = callback
        
        // 自分をQueueに追加して、結果を待ち構えます。
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    // 課金処理成功
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in queue.transactions {
            switch transaction.transactionState {
            case .purchased:
                // 成功処理
                self.buyProductionCallback?(transaction.payment.productIdentifier)
                self.buyProductionCallback = nil
                
                queue.finishTransaction(transaction)
                
            case .restored:
                // 購入が中断された場合
                self.paymentQueueRestoreCompletedTransactionsFinished(queue)
                queue.finishTransaction(transaction)
            case .deferred:
                // ファミリー共有待機処理
                // （本処理では購入失敗処理に遷移させる。）
                queue.finishTransaction(transaction)
                self.buyProductionCallback?(nil)
                self.buyProductionCallback = nil
            case .failed:
                // 処理失敗
                queue.finishTransaction(transaction)
                self.buyProductionCallback?(nil)
                self.buyProductionCallback = nil
            case .purchasing:
                // 処理中
                break
            }
        }
    }
    
    // リストア処理成功処理
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        // リストアされた商品をチェックする
        for transaction in queue.transactions {
            // 本処理では一つの製品に対する処理しか考慮していないためコールバックを解放する。
            self.buyProductionCallback?(transaction.payment.productIdentifier)
            self.buyProductionCallback = nil
        }
        
        // 終了したことを通知する。
        
        self.buyProductionCallback?(nil)
        self.buyProductionCallback = nil
    }
    
    // リストア処理に失敗
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        self.buyProductionCallback?(nil)
        self.buyProductionCallback = nil
    }
    
    // 全てのトランザクションが終わった場合の処理
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        SKPaymentQueue.default().remove(self)
    }
    
    
}
