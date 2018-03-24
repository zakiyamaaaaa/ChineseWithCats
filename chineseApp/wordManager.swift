//
//  wordManager.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/13.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class WordManger{
    
    var section1Vocabrary:Results<WordObj>
    var section2Vocabrary:Results<WordObj>
    var section3Vocabrary:Results<WordObj>
    var section4Vocabrary:Results<WordObj>
    var section5Vocabrary:Results<WordObj>
    var section6Vocabrary:Results<WordObj>
    
    var section1UnclearedVocabrary:Results<WordObj>
    var section2UnclearedVocabrary:Results<WordObj>
    var section3UnclearedVocabrary:Results<WordObj>
    var section4UnclearedVocabrary:Results<WordObj>
    var section5UnclearedVocabrary:Results<WordObj>
    var section6UnclearedVocabrary:Results<WordObj>
    
    var section1LearnedVocabrary:Results<WordObj>
    var section2LearnedVocabrary:Results<WordObj>
    var section3LearnedVocabrary:Results<WordObj>
    var section4LearnedVocabrary:Results<WordObj>
    var section5LearnedVocabrary:Results<WordObj>
    var section6LearnedVocabrary:Results<WordObj>
    
    init() {
//        let config = Realm.Configuration(
//            schemaVersion: 12,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion < 1) {}
//        })
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        section1Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 0")
        section2Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 1")
        section3Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 2")
        section4Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 3")
        section5Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 4")
        section6Vocabrary = realm.objects(WordObj.self).filter("sectionNumber == 5")
        let predicateString = "level1Result == TRUE AND level1Result == TRUE AND level2Result == TRUE AND level3Result == TRUE AND level4Result == TRUE AND level5Result == TRUE"
        
        section1LearnedVocabrary = section1Vocabrary.filter(predicateString)
        section2LearnedVocabrary = section2Vocabrary.filter(predicateString)
        section3LearnedVocabrary = section3Vocabrary.filter(predicateString)
        section4LearnedVocabrary = section4Vocabrary.filter(predicateString)
        section5LearnedVocabrary = section5Vocabrary.filter(predicateString)
        section6LearnedVocabrary = section6Vocabrary.filter(predicateString)
        
        let predicateString2 = "level1Result == FALSE OR level1Result == FALSE OR level2Result == FALSE OR level3Result == FALSE OR level4Result == FALSE OR level5Result == FALSE"
        section1UnclearedVocabrary = section1Vocabrary.filter(predicateString2)
        section2UnclearedVocabrary = section2Vocabrary.filter(predicateString2)
        section3UnclearedVocabrary = section3Vocabrary.filter(predicateString2)
        section4UnclearedVocabrary = section4Vocabrary.filter(predicateString2)
        section5UnclearedVocabrary = section5Vocabrary.filter(predicateString2)
        section6UnclearedVocabrary = section6Vocabrary.filter(predicateString2)
        
    }
    
    func returnUnclearVocabraty(level:Int,section:Int)->Results<WordObj>{
//        var levelCondition = ""
//        switch level {
//        case 0:
//            levelCondition = "level1Result"
//        default:
//            <#code#>
//        }
        
        let realm = try! Realm()
        let condition = "sectionNumber == \(section) AND level\(level + 1)Result == FALSE"
        
        return realm.objects(WordObj.self).filter(condition)
    }
    
    
    func sectionAchievment(section:Int)->Int{
        switch section {
        case 0:
            return Int(section1LearnedVocabrary.count*100/section1Vocabrary.count)
        case 1:
            return Int(section2LearnedVocabrary.count*100/section2Vocabrary.count)
        case 2:
            return Int(section3LearnedVocabrary.count*100/section3Vocabrary.count)
        case 3:
            return Int(section4LearnedVocabrary.count*100/section4Vocabrary.count)
        case 4:
            return Int(section5LearnedVocabrary.count*100/section5Vocabrary.count)
        case 5:
            return Int(section6LearnedVocabrary.count*100/section6Vocabrary.count)
        default:
            return 0
        }
    }
    
}
