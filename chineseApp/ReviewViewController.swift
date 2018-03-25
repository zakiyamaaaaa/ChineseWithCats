//
//  ReviewViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/01.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyStoreKit
import AVFoundation

class ReviewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let synthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    @IBOutlet weak var myTableView: UITableView!
    var yFlag = true
    var isPin = false
    var defaultNavHeight:CGFloat!
    var histryWordList:Results<LearnHistory>?
    
    @IBOutlet weak var upgradeButton: RoundedRectButton!
    
    
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var upgradeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IAPService.shared.getProducts()
        defaultNavHeight = navBarHeightConstraint.constant
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        histryWordList = realm.objects(LearnHistory.self)
        
        let ud = UserDefaults.standard
        if ud.bool(forKey: "purchased") == true{
            upgradeView.isHidden = true
        }else{
            let price = StoreKitManager.shared.price
            upgradeButton.setTitle("アップグレードする(\(price))", for: .normal)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let wordCount = histryWordList?.count else { return 0 }
        
        let isPurchased = UserDefaults.standard.bool(forKey: "purchased")

        if isPurchased == true && wordCount > 9 {
            return histryWordList?.count ?? 0
        } else if isPurchased == false && wordCount > 10 {
            return 9 + 1
        } else {
            return wordCount + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewWordTableViewCell
        
        guard let wordList = histryWordList else { return cell }
        
        guard let word = histryWordList?[indexPath.row] else { return  cell}
        if UserDefaults.standard.bool(forKey: "purchased") == false && (indexPath.row == wordList.count + 1 || indexPath.row == 9){
            let cell = UITableViewCell()
            cell.textLabel?.text = "機能追加する\n  学習履歴が１０個以上表示されます"
            cell.textLabel?.numberOfLines = 2
            let textArray = cell.textLabel?.text?.components(separatedBy: "\n")
            let attrText = NSMutableAttributedString(string: cell.textLabel!.text!)
            let supplirange = NSString(string: cell.textLabel!.text!).range(of: textArray![1])
            let mainrange = NSString(string: cell.textLabel!.text!).range(of: textArray![0])
            attrText.addAttribute(.font, value: UIFont.systemFont(ofSize: 11), range:supplirange)
            attrText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range:mainrange)
            cell.textLabel?.attributedText = attrText
            
            return cell
        }
        cell.soundButton.addTarget(self, action: #selector(self.speechWord(sender:)), for: .touchUpInside)
        cell.levelLabel.text = "レベル" + String(word.level)
        cell.soundButton.tag = indexPath.row
        cell.wordLabel.text = word.word
        cell.pinyinLabel.text = word.pinyin
        cell.sentenseLabel.text = word.sentence
        if let difference = calculateDate(time: word.date).day{
            cell.dateLabel.text = String(describing: difference) + "日前"
            if difference == 0{
                cell.dateLabel.text = "今日"
            }
        }
        
        
        switch word.result {
        case false:
            cell.resultImageView.image = #imageLiteral(resourceName: "wrong_icon")
        case true:
            cell.resultImageView.image = #imageLiteral(resourceName: "correct_icon")
        }
        
        return cell
        
    }
    
    
    
    @objc func speechWord(sender:UIButton){
        guard let words = histryWordList else { return }
        
        let word = words[sender.tag].word
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let words = histryWordList else { return }
        
        if indexPath.row == words.count || (UserDefaults.standard.bool(forKey: "purchased") == false && indexPath.row == 9 ){
            // 課金画面
            purchase()
            return
        }
        
        let word = words[indexPath.row].word
        let meaning = words[indexPath.row].meaning
        let exsentence = words[indexPath.row].sentence
        let pinyin = words[indexPath.row].pinyin
        
        let utterance = AVSpeechUtterance(string: exsentence)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
        
        let alert = UIAlertController(title: word, message: pinyin + "\n\n" + "[意味]" + meaning + "\n\n" + "[例文]" + exsentence, preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:
                {
                    alert.dismiss(animated: true, completion: {
                        
                    })
            }
                
            )
        })
    }
    
    func calculateDate(time:Date)->DateComponents{
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let today = Date()
        let target = calendar.startOfDay(for: time)
        let start = calendar.startOfDay(for: today)
        
        return calendar.dateComponents([.day], from: target, to: start)
    }
    
    @IBAction func resultSegmentChanged(_ sender: UISegmentedControl) {
        //0:全部
        //1:正解
        //2:不正解
        
        resultSegmentIndex = sender.selectedSegmentIndex
        segmentChanged()
        
    }
    
    var resultSegmentIndex = 0
    var dateSegmentIndex = 0
    
    @IBAction func reviewButtonPushed(_ sender: Any) {
        
        if let list = histryWordList{
            if list.count > 0{
                ScreenTransitionManager.shared.goToReviewQuiz(words: list)
            }else{
                let alert = UIAlertController(title: "復習する単語がありません", message: "", preferredStyle: .alert)
                self.present(alert, animated: true, completion: { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { 
//                        self.dismiss(animated: true, completion: nil)
                        alert.dismiss(animated: true, completion: nil)
                    })
                })
            }
        }
    }
    
    
    @IBAction func dateSegmentChanged(_ sender: UISegmentedControl) {
        
        dateSegmentIndex = sender.selectedSegmentIndex
        segmentChanged()
        
    }
    
    func segmentChanged(){
        let realm = try! Realm()
        //結果のフィルター
        switch resultSegmentIndex{
        case 0:
            histryWordList = realm.objects(LearnHistory.self)
        case 1:
            histryWordList = realm.objects(LearnHistory.self).filter("result == TRUE")
        case 2:
            histryWordList = realm.objects(LearnHistory.self).filter("result == FALSE")
        default:
            break
        }
        
        //日付のフィルター
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let today = Date()
        let start = calendar.startOfDay(for: today)
        
        switch dateSegmentIndex {
        case 0:
            break
        case 1://今日
            let fromDate = start
            let toDate = calendar.date(byAdding: .day, value: 1, to: start)!
            
            histryWordList = histryWordList?.filter("date >= %@ AND date < %@",fromDate,toDate)
        case 2://昨日
            let fromDate = calendar.date(byAdding: .day, value: -1, to: start)!
            let toDate = calendar.date(byAdding: .day, value: 0, to: start)!
            histryWordList = histryWordList?.filter("date >= %@ AND date < %@",fromDate,toDate)
        case 3://3日前
            let fromDate = calendar.date(byAdding: .day, value: -3, to: start)!
            let toDate = calendar.date(byAdding: .day, value: -2, to: start)!
            histryWordList = histryWordList?.filter("date >= %@ AND date < %@",fromDate,toDate)
        case 4://7日前
            let fromDate = calendar.date(byAdding: .day, value: -7, to: start)!
            let toDate = calendar.date(byAdding: .day, value: -6, to: start)!
            histryWordList = histryWordList?.filter("date >= %@ AND date < %@",fromDate,toDate)
        case 5://1ヶ月前
            let fromDate = calendar.date(byAdding: .day, value: -30, to: start)!
            let toDate = calendar.date(byAdding: .day, value: -29, to: start)!
            histryWordList = histryWordList?.filter("date >= %@ AND date < %@",fromDate,toDate)
        default:
            break
        }
        
        
        myTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func upgradeButtonPushed(_ sender: Any) {
        
            }
    
    private func purchase() {
        SwiftyStoreKit.purchaseProduct("com.zakiyamaaaaa.chinesewithcats") { (result) in
            
            if case .success(let purchase) = result{
                if purchase.needsFinishTransaction{
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
            }
            switch result{
            case .success(let purchase):
                
                print("purchase:\(purchase.productId)")
                let ud = UserDefaults.standard
                ud.set(true, forKey: "purchased")
                ud.synchronize()
                self.upgradeView.isHidden = true
                
            case .error(let error):
                print("error")
                print(error.code)
                
            }
        }
    }
    
    @IBAction func restoreButtonPushed(_ sender: Any) {
        SwiftyStoreKit.restorePurchases { (result) in
            for product in result.restoredPurchases{
                if product.needsFinishTransaction{
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
            }
            if result.restoredPurchases.count > 0{
                let ud = UserDefaults.standard
                ud.set(true, forKey: "purchased")
                ud.synchronize()
                self.upgradeView.isHidden = true
            }
        }
    }

}

extension UIViewController{
    
    func getInfo(purchase:IAPProduct){
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.retrieveProductsInfo([purchase.rawValue]) { (result) in
            NetworkActivityIndicatorManager.networkOperationFinished()
            self.showAlert(self.alertForProductRetrievalInfo(result: result))
        }
        
    }
    
    func purchase(purchase:IAPProduct){
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.purchaseProduct(purchase.rawValue) { (result) in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            if case .success(let product) = result{
                if product.needsFinishTransaction{
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                
                if let alert = self.alertForPurchaseResult(result: result){
                    self.showAlert(alert)
                }
                
            }
        }
    }
    
    func restorePurchases(){
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.restorePurchases(atomically: true, applicationUsername: "") { (result) in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            for product in result.restoredPurchases{
                if product.needsFinishTransaction{
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
            }
            
            self.showAlert(self.alertForRestorePurchases(result: result))
        }
    }
    
    func verifiReceipt(){
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        let appValidator = AppleReceiptValidator(service: .production)
        SwiftyStoreKit.verifyReceipt(using: appValidator, password: IAPService.shared.secret) { (result) in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(self.alertForVerifyReceipt(result: result))
            
//            if case .error(let error) = result{
//                if case  = error{
//
//                }
//            }
        }
    }
    
    func verifyPurchase(product:IAPProduct){
        NetworkActivityIndicatorManager.NetworkOperationStarted()
        let appValidator = AppleReceiptValidator(service: .production)
        SwiftyStoreKit.verifyReceipt(using: appValidator, password: IAPService.shared.secret, forceRefresh: true) { (result) in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            switch result{
            case .success(let receipt):
                let productId = product.rawValue
                
                let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: productId, inReceipt: receipt)
                self.showAlert(self.alertForVerifyPurchase(result: purchaseResult))
            case .error(let error):
                self.showAlert(self.alertForVerifyReceipt(result: result))
            }
        }
    }
    
    
}


extension UIViewController{
    
    func alertWithTitle(_ title:String,message:String)->UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    func showAlert(_ alert:UIAlertController){
        guard self.presentedViewController != nil else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func alertForProductRetrievalInfo(result:RetrieveResults)->UIAlertController{
        if let product = result.retrievedProducts.first{
            let priceString = product.localizedPrice!
            return alertWithTitle(product.localizedTitle, message: priceString)
        }
        else if let invalidProductID = result.invalidProductIDs.first{
            return alertWithTitle("could not retreive product info", message: "invalid product identifier")
        }else{
            let errorString = result.error?.localizedDescription ?? "unknown error.please contact support"
            return alertWithTitle("could not retreive product info", message: errorString)
        }
    }
    
    
    
    func alertForPurchaseResult(result:PurchaseResult)->UIAlertController?{
        switch result {
        case .success(let purchase):
            print("purchased succeed:\(purchase.productId)")
            return alertWithTitle("Thank you", message: "Purchase completed")
        case .error(let error):
            switch error.code {
            case .unknown: return alertWithTitle("Purchase failed", message: error.localizedDescription)
            case .clientInvalid: // client is not allowed to issue the request, etc.
                return alertWithTitle("Purchase failed", message: "Not allowed to make the payment")
            case .paymentCancelled: // user cancelled the request, etc.
                return nil
            case .paymentInvalid: // purchase identifier was invalid, etc.
                return alertWithTitle("Purchase failed", message: "The purchase identifier was invalid")
            case .paymentNotAllowed: // this device is not allowed to make the payment
                return alertWithTitle("Purchase failed", message: "The device is not allowed to make the payment")
            case .storeProductNotAvailable: // Product is not available in the current storefront
                return alertWithTitle("Purchase failed", message: "The product is not available in the current storefront")
            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
                return alertWithTitle("Purchase failed", message: "Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
                return alertWithTitle("Purchase failed", message: "Could not connect to the network")
            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
                return alertWithTitle("Purchase failed", message: "Cloud service was revoked")
            }
        }
    }
    
    func alertForRestorePurchases(result:RestoreResults)->UIAlertController{
        if result.restoredPurchases.count > 0{
            print("restore failed:\(result.restoreFailedPurchases)")
            return alertWithTitle("RestoreFailed", message: "Unknown error,please contact surpport")
        }else if result.restoredPurchases.count > 0{
            return alertWithTitle("Purchase restored", message: "All puchaseshave been restored ")
        }else{
            return alertWithTitle("nothing to restore", message: "nothing to buy")
        }
    }
    
    func alertForVerifyReceipt(result:VerifyReceiptResult)->UIAlertController{
        switch result {
        case .success(let reciept):
            return alertWithTitle("Receipt Verified", message: "Reciept Verified remotely")
        case .error(let error):
            switch error{
            case .noRemoteData:
                return alertWithTitle("reciept verification", message: "no reciept data found")
            default:
                return alertWithTitle("reciept verification", message: "no")
            }
        }
    }
    
    func alertForVerifySubscription(result:VerifySubscriptionResult)->UIAlertController{
        switch result {
        case .purchased(let expiryDate):
            return alertWithTitle("Product is Purchased", message: "Product is valid until \(expiryDate)")
        case .notPurchased:
            return alertWithTitle("Not purchased", message: "this product has never been purchased")
        case .expired(let expiryDate):
            return alertWithTitle("PRoduct Expired", message: "Product is expired since \(expiryDate)")
        }
    }
    
    func alertForVerifyPurchase(result:VerifyPurchaseResult)->UIAlertController{
        switch result {
        case .purchased:
            return alertWithTitle("Product is purchased", message: "Product will not expire")
        case .notPurchased:
            return alertWithTitle("Product is not purchased", message: "Product has never been purchased")
        }
    }
    
    func alertForRefreshReciept(result:RefreshReceiptResult)->UIAlertController{
        switch result {
        case .success(let receiptDate):
            return alertWithTitle("Receipt Refreched", message: "Receipt refreshed successfully:\(receiptDate.description)")
            
        case .error(let error):
            return alertWithTitle("Receive refresh failed", message: "Receipt refresh failed:Error\(error.localizedDescription)")
        }
    }
    
}

extension ReviewViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("velocity:\(velocity.y)")
        print("willenddragg:\(scrollView.contentOffset.y)")
        yFlag = velocity.y > 0 ? true : false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        _ = scrollBeginingPoint.y < scrollView.contentOffset.y ? print("下") : print("上")
        if yFlag == true, navBarHeightConstraint.constant > 40, isPin == false {
            navBarHeightConstraint.constant -= 2
        }
        
        if yFlag == false, navBarHeightConstraint.constant < defaultNavHeight , isPin == false{
            navBarHeightConstraint.constant += 2
        }
    }
    
}

