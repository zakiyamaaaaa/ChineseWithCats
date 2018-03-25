//
//  ReviewResultViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/06.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift

class ReviewResultViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    var quizList:[LearnHistory]!
    var quizList2:Results<LearnHistory>!
    var scoreList = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        quizList = QuizManager.shared.reviewList
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        QuizManager.shared.reset()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizList2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "resultCell") as! QuizResultTableViewCell
        cell.firstLabel.text = "第\(indexPath.row + 1)問"
        let words = quizList2[indexPath.row]
        cell.secondLabel.text = words.word
        
        cell.resultImageView.image = scoreList[indexPath.row] ? #imageLiteral(resourceName: "correctIcon") : #imageLiteral(resourceName: "incorrectIcon")
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retryButtonPushed(_ sender: Any) {
        
        ScreenTransitionManager.shared.goToReviewQuiz(words: quizList2)
    }
    
    @IBAction func cancelButtonPushed(_ sender: Any) {
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
