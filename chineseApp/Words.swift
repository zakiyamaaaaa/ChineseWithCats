//
//  Word.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/08/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import RealmSwift

class WordObj:Object{
    
    @objc dynamic var word = ""
    @objc dynamic var meaning = ""
    @objc dynamic var sentense = ""
    @objc dynamic var pinyin = ""
    @objc dynamic var sectionNumber = 0
    @objc dynamic var clearCount = 0
    @objc dynamic var wrongCount = 0
    @objc dynamic var level1Result = false
    @objc dynamic var level2Result = false
    @objc dynamic var level3Result = false
    @objc dynamic var level4Result = false
    @objc dynamic var level5Result = false
    @objc dynamic var level6Result = false
    
    override static func primaryKey()->String?{
        return "sentense"
    }
    
}
