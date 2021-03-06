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

        
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var level1Button: UIButton!
    @IBOutlet weak var level2Button: UIButton!
    @IBOutlet weak var level3Button: UIButton!
    @IBOutlet weak var level4Button: UIButton!
    @IBOutlet weak var level5Button: UIButton!
    @IBOutlet weak var springImageView1: SpringImageView!
    @IBOutlet weak var springImageView2: SpringImageView!
    var quizVocabrary:Results<WordObj>!
    let screenWidth = UIScreen.main.bounds.size.width
    var levelButtonList:[UIButton]!
    var selectLevel = 0
    var sectionNumber = 0
    //初期の選択ボタンが一番初級レベルなので
    var pointUnit = 10
    var currentImageView:SpringImageView!
    @IBOutlet weak var quizStartButton: RoundedRectButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImageView = springImageView1
        
        // このアプリの購入履歴があるかどうか調べる
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
        
        levelButtonList = [level1Button,level2Button,level3Button,level4Button,level5Button]
        
        for (index,button) in levelButtonList.enumerated(){
            button.setImage(QuizType(rawValue: index)!.defultIconImage, for: .normal)
            button.tintColor = UIColor.gray
            button.addTarget(self, action: #selector(self.levelButtonPushed(sender:)), for: .touchUpInside)
            button.tag = index
            
        }
        
        levelButtonList.first?.tintColor = UIColor.red
        levelButtonList.first?.setImage(QuizType.level1.iconImage, for: .normal)
        bgImageView.image = QuizType.level1.bgImage
    }
    
    @IBAction func quizTypeTutorial(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        })
        
        
        ok.setValue(UIColor.mainColor(), forKey: "titleTextColor")
        
        alert.addImage(image: #imageLiteral(resourceName: "tutorial_stage"))
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func stageTypeTutorial(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        })
        
        
        ok.setValue(UIColor.mainColor(), forKey: "titleTextColor")
        
        alert.addImage(image: #imageLiteral(resourceName: "tutorial_type"))
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func levelButtonPushed(sender:UIButton){
        
        for button in levelButtonList{
            button.setImage(QuizType(rawValue: button.tag)!.defultIconImage, for: .normal)
        }
        
        selectLevel = sender.tag
        let quizType = QuizType(rawValue: sender.tag)!
        sender.setImage(quizType.iconImage, for: .normal)
        bgImageView.image = quizType.bgImage
    }
    
    @IBAction func goToTest(_ sender: Any) {
        ScreenTransitionManager.shared.goToQuiz(section: sectionNumber, level: selectLevel)
        
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        let catType = CatType(rawValue: sender.selectedSegmentIndex)!
        let image = catType.image
        sectionNumber = sender.selectedSegmentIndex
        
        switch currentImageView {
        case springImageView1:
            springImageView2.image = image
            UIView.animate(withDuration: 2, animations: {
                sender.isEnabled = false
                self.springImageView1.animation = "zoomOut"
                self.springImageView1.animate()
                self.springImageView2.animation = "zoomIn"
                self.springImageView2.animate()
                
            }, completion: { (Bool) in
                sender.isEnabled = true
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
            }, completion: { (Bool) in
                sender.isEnabled = true
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
    

}
