//
//  ProfileViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/12.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var wordM:WordManger = WordManger()
    override func viewWillAppear(_ animated: Bool) {
        section1AchievementLabel.text = String(wordM.sectionAchievment(section: 0)) + "%"
        section2AchievementLabel.text = String(wordM.sectionAchievment(section: 1)) + "%"
        section3AchievementLabel.text = String(wordM.sectionAchievment(section: 2)) + "%"
        section4AchievementLabel.text = String(wordM.sectionAchievment(section: 3)) + "%"
        section5AchievementLabel.text = String(wordM.sectionAchievment(section: 4)) + "%"
        section6AchievementLabel.text = String(wordM.sectionAchievment(section: 5)) + "%"
        
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
        levelLabel.text = "\(user.level)"
        
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
