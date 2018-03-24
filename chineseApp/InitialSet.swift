//
//  InitialSet.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import RealmSwift

class InitialSet {
    let wordsList:[[[String]]] = [Vocabrary().list,Vocabrary().list2,Vocabrary().list3,Vocabrary().list4,Vocabrary().list5,Vocabrary().list6]
    lazy var realm = try! Realm()
    
    //ユーザークラスをセット
    func setUser(){
        
        try! realm.write {
            realm.add(User())
        }
    }
    
    //単語学習履歴クラスをセット
    func setHistory(){
        
        try! realm.write {
            realm.add(LearnHistory())
        }
    }
    
    
    //単語リストをセット
    func setWordList(){
        
        
        for (index,words) in wordsList.enumerated(){
            for i in 0 ... words.count - 1{
                let word = WordObj()
                word.word = words[i][0]
                word.meaning = words[i][1]
                word.sentense = words[i][2]
                word.pinyin = words[i][3]
                word.sectionNumber = index
                word.clearCount = 0
                word.level1Result = false
                word.level2Result = false
                word.level3Result = false
                word.level4Result = false
                word.level5Result = false
                try! realm.write {
                    realm.add(word)
                    
                }
            }
        }
    }
    
    
}
