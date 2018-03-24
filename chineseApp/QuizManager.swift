//
//  Quiz.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/07.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift

class QuizManager{
    
    init(){

    }
    
    static var shared = QuizManager()
    var correctNumber = 0
    var numberOfQuiz = 0
    var pointUnit:Int{
        get{
            switch level {
            case 0:
                return 10
            case 1:
                return 10
            case 2:
                return 10
            case 3:
                return 20
            case 4:
                return 30
            case 5:
                return 30
            default:
                return 10
            }
            
        }
    }
    var sectionNumber = 0
    var level = 0
    var score = 0
    var quizList:[WordObj] = []
    var reviewList:[LearnHistory] = []
    var scoreList:[Bool] = []
    
    func reset(){
        correctNumber = 0
        numberOfQuiz = 0
        score = 0
        reviewList = []
        quizList = []
        scoreList = []
    }
    
}
