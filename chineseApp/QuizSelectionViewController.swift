//
//  QuizSelectionViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/27.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import StoreKit
import SwiftyStoreKit
import Spring

class QuizSelectionViewController: UIViewController {

    @IBOutlet weak var level1Button: UIButton!
    @IBOutlet weak var level2Button: UIButton!
    @IBOutlet weak var level3Button: UIButton!
    @IBOutlet weak var level4Button: UIButton!
    @IBOutlet weak var level5Button: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var springImageView1: SpringImageView!
    @IBOutlet weak var springImageView2: SpringImageView!
    //    @IBOutlet weak var myImageView1: UIImageView!
//    @IBOutlet weak var myImageView2: UIImageView!
    var quizVocabrary:Results<WordObj>!
    let screenWidth = UIScreen.main.bounds.size.width
    var levelButtonList:[UIButton]!
    var selectLevel = 0
    var sectionNumber = 0
    //初期の選択ボタンが一番初級レベルなので
    var pointUnit = 10
//    var currentImageView:UIImageView!
    var currentImageView:SpringImageView!
    @IBOutlet weak var quizStartButton: RoundedRectButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImageView = springImageView1
        
        SwiftyStoreKit.retrieveProductsInfo(["com.zakiyamaaaaa.chinesewithcats"]) { result in
            
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                StoreKitManager.shared.description = product.description
                StoreKitManager.shared.price = product.localizedPrice!
                
                
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                
            }
            else {
                print("Error: \(result.error)")
            }
        }
        
        let buttonDefaultImage = #imageLiteral(resourceName: "cat_icon").withRenderingMode(.alwaysTemplate)
//        springImageView2.transform = CGAffineTransform.init(translationX: screenWidth, y: 0)
        
        levelButtonList = [level1Button,level2Button,level3Button,level4Button,level5Button]
        
        for (index,button) in levelButtonList.enumerated(){
            button.alpha = 0.7
            button.setImage(buttonDefaultImage, for: .normal)
            button.tintColor = UIColor.gray
            button.addTarget(self, action: #selector(self.levelButtonPushed(sender:)), for: .touchUpInside)
            button.tag = index
            
        }
        myLabel.text = quizType.a.rawValue
        level1Button.tintColor = UIColor.red
        level1Button.alpha = 1
        // Do any additional setup after loading the view.
    }
    
    @objc func levelButtonPushed(sender:UIButton){
        
        for button in levelButtonList{
            button.alpha = 0.7
            button.tintColor = UIColor.gray
        }
        sender.alpha = 1
        sender.tintColor = UIColor.red
        selectLevel = sender.tag
        
        //選択されたボタンで、ラベルの表示変更
        switch sender.tag {
        case 0:
            myLabel.text = quizType.a.rawValue
            
        case 1:
            myLabel.text = quizType.b.rawValue
            
        case 2:
            myLabel.text = quizType.c.rawValue
            
        case 3:
            myLabel.text = quizType.d.rawValue
            
        case 4:
            myLabel.text = quizType.e.rawValue
            
        default:
            break
        }
        
    }
    
    
    @IBAction func goToTest(_ sender: Any) {
        ScreenTransitionManager.shared.goToQuiz(section: sectionNumber, level: selectLevel)
        
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        var image:UIImage = UIImage()
        sectionNumber = sender.selectedSegmentIndex
        switch sender.selectedSegmentIndex {
        case 0:
            image = #imageLiteral(resourceName: "ball1")
        case 1:
            image = #imageLiteral(resourceName: "ball2")
        case 2:
            image = #imageLiteral(resourceName: "ball3")
        case 3:
            image = #imageLiteral(resourceName: "ball4")
        case 4:
            image = #imageLiteral(resourceName: "ball5")
        case 5:
            image = #imageLiteral(resourceName: "ball6")
        default:
            break
        }
        
        switch currentImageView {
        case springImageView1:
            springImageView2.image = image
            UIView.animate(withDuration: 2, animations: {
                sender.isEnabled = false
                self.springImageView1.animation = "zoomOut"
                self.springImageView1.animate()
                self.springImageView2.animation = "zoomIn"
                self.springImageView2.animate()
                
//                self.myImageView1.transform = CGAffineTransform.init(translationX: -self.screenWidth, y: 0)
//                self.myImageView2.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: { (Bool) in
                sender.isEnabled = true
//                self.springImageView1.transform = CGAffineTransform.init(translationX: self.screenWidth, y: 0)
            })
            currentImageView = springImageView2
            break
        case springImageView2:
            springImageView1.image = image
            UIView.animate(withDuration: 2, animations: {
                sender.isEnabled = false
                self.springImageView2.animation = "zoomOut"
                self.springImageView2.animate()
                self.springImageView1.animation = "zoomIn"
                self.springImageView1.animate()
//                self.myImageView2.transform = CGAffineTransform.init(translationX: -self.screenWidth, y: 0)
//                self.myImageView1.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: { (Bool) in
                sender.isEnabled = true
//                self.springImageView2.transform = CGAffineTransform.init(translationX: self.screenWidth, y: 0)
            })
            currentImageView = springImageView1
        default:
            break
        }
        
        quizVocabrary = WordManger().returnUnclearVocabraty(level: selectLevel, section: sectionNumber)
        if quizVocabrary.count > 0{
            self.quizStartButton.isEnabled = true
        }else{
            self.quizStartButton.isEnabled = false
        }
        
    }
    
    @IBAction func showWaytoPlay(_ sender: Any) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
