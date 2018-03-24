//
//  AppDelegate.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/08/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import StoreKit
import SwiftyStoreKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("didFinish")
        FirebaseApp.configure()
        let ud = UserDefaults.standard
        let flag = ud.bool(forKey: "first")
        
        if flag != true{
            //realmDBを削除
            ud.set(true, forKey: "first")
            SwiftyStoreKit.completeTransactions(atomically: true) { (products) in
                for product in products{
                    
                    if product.transaction.transactionState == .purchased || product.transaction.transactionState == .restored{
                        //保存処理
                        let ud = UserDefaults.standard
                        ud.set(true, forKey: "purchased")
                        ud.synchronize()
                        
                        if product.needsFinishTransaction{
                            SwiftyStoreKit.finishTransaction(product.transaction)
                        }
                        
                    }
                }
            }
            InitialSet().setWordList()
            InitialSet().setUser()
        }
        
        
        
//        let productID = ["com.zakiyamaaaaa.chinesewithcats"]
//        StoreKitAccessor.shared.cacheProducts(productIdentifiers: productID)
        
//        if let product = StoreKitAccessor.shared.getCacheProduct(productIdentifier: productID.first!) {
//            // 「$1」などの課金価格を表示する。
//
//        }
        
//        ProductManager.share.validateProductsIdentifiers(productID: productID)
        
        
//        let config = Realm.Configuration(
//            schemaVersion: 12,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion < 1) {}
//        })
//        Realm.Configuration.defaultConfiguration = config
        
//        InitialSet().setHistory()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("willresign")
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("didenter")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("willenter")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("didbecome")
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("willterminate")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

