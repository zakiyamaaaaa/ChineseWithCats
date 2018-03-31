//
//  ProfileViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/12.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var section1AchievementLabel: UILabel!
    @IBOutlet weak var section2AchievementLabel: UILabel!
    @IBOutlet weak var section3AchievementLabel: UILabel!
    @IBOutlet weak var section4AchievementLabel: UILabel!
    @IBOutlet weak var section5AchievementLabel: UILabel!
    @IBOutlet weak var section6AchievementLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var section1Imageview: UIImageView!
    @IBOutlet weak var section2ImageView: UIImageView!
    @IBOutlet weak var section3ImageView: UIImageView!
    
    @IBOutlet weak var section4ImageView: UIImageView!
    @IBOutlet weak var section5ImageView: UIImageView!
    @IBOutlet weak var section6ImageView: UIImageView!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var userStateLabel: UILabel!
    var user = UserManager()
    var wordM:WordManger = WordManger()
    var snapAnimator:UIDynamicAnimator!
    var snapBehavior:UISnapBehavior!
    @IBOutlet weak var profileView: RoundedRectView!
    var profileViewPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderColor = UIColor.mainColor().cgColor
        profileImageView.layer.borderWidth = 3
        
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedButton(sender:)))
        profileView.addGestureRecognizer(dragGesture)
        dragGesture.delegate = self
        
        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.profileView.center.y -= 40
        }, completion: {(bool) in
            self.profileViewPosition = self.profileView.center
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        section1AchievementLabel.text = wordM.sectionAchievment(section: 0).description + "%"
        section2AchievementLabel.text = wordM.sectionAchievment(section: 1).description + "%"
        section3AchievementLabel.text = wordM.sectionAchievment(section: 2).description + "%"
        section4AchievementLabel.text = wordM.sectionAchievment(section: 3).description + "%"
        section5AchievementLabel.text = wordM.sectionAchievment(section: 4).description + "%"
        section6AchievementLabel.text = wordM.sectionAchievment(section: 5).description + "%"
        
        if wordM.sectionAchievment(section: 0) == 100{
            section1AchievementLabel.text = ""
            section1Imageview.image = #imageLiteral(resourceName: "ball1_clear")
        }
        if wordM.sectionAchievment(section: 1) == 100{
            section2AchievementLabel.text = ""
            section2ImageView.image = #imageLiteral(resourceName: "ball2_clear")
        }
        if wordM.sectionAchievment(section: 2) == 100{
            section3AchievementLabel.text = ""
            section3ImageView.image = #imageLiteral(resourceName: "ball3_clear")
        }
        if wordM.sectionAchievment(section: 3) == 100{
            section4AchievementLabel.text = ""
            section4ImageView.image = #imageLiteral(resourceName: "ball4_clear")
        }
        if wordM.sectionAchievment(section: 4) == 100{
            section5AchievementLabel.text = ""
            section5ImageView.image = #imageLiteral(resourceName: "ball5_clear")
        }
        if wordM.sectionAchievment(section: 5) == 100{
            section6AchievementLabel.text = ""
            section6ImageView.image = #imageLiteral(resourceName: "ball6_clear")
        }
        
        profileImageView.image = user.userImage
        userStateLabel.text = user.userClass
        levelLabel.text = user.level.description
        
        
        
    }
    
    @objc func draggedButton(sender: UIPanGestureRecognizer) {
        
        let move = sender.translation(in: view)
        sender.view?.center.x += move.x
        sender.view?.center.y += move.y
        
        switch sender.state {
        case .ended:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                sender.view?.center = self.profileViewPosition
            }, completion: nil)
        default:
            break
        }
        sender.setTranslation(.zero, in: view)
    }
    
    @IBAction func resetButtonPushed(_ sender: Any) {
        
        let alert = UIAlertController(title: "すべてのデータを削除します。よろしいですか？", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
            let successAlert = UIAlertController(title: "データを削除しました", message: "", preferredStyle: .alert)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { 
                self.present(successAlert, animated: true, completion: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { 
                        successAlert.dismiss(animated: true, completion: nil)
                    })
                    
                })
            })
            
        }
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            //
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true) { 
            
            
        }
    }
    
    
    func reset(){
        let realm = try! Realm()
        let histry = realm.objects(LearnHistory.self)
        histry.forEach { (item) in
            try! realm.write {
                realm.delete(item)
            }
        }
        
        let words = realm.objects(WordObj.self)
        words.forEach { (word) in
            try! realm.write {
                word.clearCount = 0
                word.level1Result = false
                word.level2Result = false
                word.level3Result = false
                word.level4Result = false
                word.level5Result = false
                word.wrongCount = 0
            }
        }
        
        let user = realm.objects(User.self)
        try! realm.write {
            user.first?.experience = 0
        }
        
    }
}
