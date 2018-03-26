//
//  ScreenTransitionManager.swift
//  
//
//  Created by shoichiyamazaki on 2017/09/07.
//
//

import UIKit
import RealmSwift

class ScreenTransitionManager{
    
    static let shared = ScreenTransitionManager()
    private init(){
        
    }
    
    private var targetViewController:UIViewController?{
        var tc = UIApplication.shared.keyWindow?.rootViewController
        while tc?.presentedViewController != nil {
            tc = tc!.presentedViewController
        }
        return tc
    }
    
    /// 横にスライド表示
    private func show(_ controller: UIViewController){
        targetViewController?.show(controller, sender: targetViewController)
    }
    
    /// 新しいnavigationControllerでモーダル表示
    /// modalPresentationStyleやmodalTransitionStyleを設定しなければ下から出てくる
    private func presentModalWithNavigation(_ controller: UIViewController){
        let nc = UINavigationController(rootViewController: controller)
        targetViewController?.present(nc, animated: true, completion: nil)
    }
    
    /// クロスディゾルブでスーッとモーダル表示
    private func showTranslucenceView(_ controller: UIViewController) {
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        targetViewController?.present(controller, animated: true, completion: nil)
    }
    
    func goToResult(){
        let storyboard = UIStoryboard(name: "WordTest", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "resultQuizViewController")
        showTranslucenceView(controller)
    }
    
    func goToQuiz(section:Int, level:Int, numberOfQuiz: Int = 5){
        let storyboard = UIStoryboard(name: "WordTest", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! WordTestViewController
        controller.sectionNumber = section
        controller.levelNumber = level
        QuizManager.shared.sectionNumber = section
        QuizManager.shared.level = level
        controller.numberOfQuiz = numberOfQuiz
        
        show(controller)
    }
    
    func goToReviewQuiz(words:Results<LearnHistory>){
        let storyboard = UIStoryboard(name: "WordReview", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! WordReviewViewController
        controller.reviewWords = words
        show(controller)
    }
    
    func goToReviewResult(words:Results<LearnHistory>,scoreList:[Bool]){
        let storyboard = UIStoryboard(name: "WordReview", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "reviewResult") as! ReviewResultViewController
        controller.scoreList = scoreList
        controller.quizList2 = words
        show(controller)
    }
    
    func goToMain(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()
        show(controller!)
    }
    
    
}
