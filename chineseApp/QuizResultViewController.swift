//
//  QuizResultViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/07.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift

class QuizResultViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var experienceView: UIProgressView!
    @IBOutlet weak var quizResultTableView: UITableView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    var quizList:[WordObj]!
    var scoreList:[Bool]!
    let score = QuizManager.shared.score
    let realm = try! Realm()
    @IBOutlet weak var levelStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizResultTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        levelStackView.isHidden = true
        
        quizList = QuizManager.shared.quizList
        scoreList = QuizManager.shared.scoreList
        
        
        
        let experiencePoint = UserManager.shared.experience
        
        experienceView.progress = Float(experiencePoint%100)/100
        
        pointLabel.text = "\(score)"
        previousValue = UserManager.shared.experience
        UserManager.shared.experience += score
        let user = realm.objects(User.self).first
        
        try! realm.write{
            user?.experience = UserManager.shared.experience
        }
    }
    
    var previousValue = 0
    var flag = false
    var user = UserManager()
    
    override func viewDidAppear(_ animated: Bool) {
        let value = previousValue%100 + score
        //レベルアップするとき
        if value >= 100{
            levelStackView.isHidden = false
            levelLabel.text = "\(UserManager.shared.experience/100)"
            
            self.experienceView.setProgress(1, animated: true)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.experienceView.progress = 0
                self.experienceView.setProgress(Float(Float(value%100)/100), animated: true)
            })
            
        }else{
            experienceView.setProgress(Float(Float(value)/100), animated: true)
        }
        
//        experienceView.setProgress(Float(UserManager.shared.experience)/100, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        QuizManager.shared.reset()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quizResultTableView.dequeueReusableCell(withIdentifier: "resultCell") as! QuizResultTableViewCell
        cell.firstLabel.text = "第\(indexPath.row + 1)問"
        let words = quizList[indexPath.row]
        cell.secondLabel.text = words.word
        
        //☆の数
        let imageViewList = [cell.imageView1,cell.imageView2,cell.imageView3,cell.imageView4,cell.imageView5]
        //初期化
        imageViewList.forEach({ (imageView) in
            imageView?.image = #imageLiteral(resourceName: "cat_icon")
        })
        
        
        if words.level1Result == true{
            cell.imageView1.image = #imageLiteral(resourceName: "cat_icon2")
        }
        if words.level2Result == true{
            cell.imageView2.image = #imageLiteral(resourceName: "cat_icon2")
        }
        if words.level3Result == true{
            cell.imageView3.image = #imageLiteral(resourceName: "cat_icon2")
        }
        if words.level4Result == true{
            cell.imageView4.image = #imageLiteral(resourceName: "cat_icon2")
        }
        if words.level5Result == true{
            cell.imageView5.image = #imageLiteral(resourceName: "cat_icon2")
        }
        
        //正解・不正解を結果のアイコン
        switch scoreList[indexPath.row] {
        case true:
            cell.resultImageView.image = #imageLiteral(resourceName: "correct_icon")
        case false:
            cell.resultImageView.image = #imageLiteral(resourceName: "wrong_icon")
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondTestViewController
        vc.flag = flag
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
//        let vc = segue.source as! SecondTestViewController
//        if vc.flag == true{
//            progressView.progress = 0
//            print("up")
//        }else{
//            progressView.progress = 1
//            print("down")
//        }
//        
//        let progressValue:Float = Float(Float(value%100)/100)
//        progressView.setProgress(progressValue, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retryButtonTapped(_ sender: Any) {
        
        ScreenTransitionManager.shared.goToQuiz(section: QuizManager.shared.sectionNumber, level: QuizManager.shared.level)
    }

    @IBAction func quitButtonTapped(_ sender: Any) {
        ScreenTransitionManager.shared.goToMain()
        
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
