//
//  learnHistory.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import RealmSwift

class LearnHistory: Object {
    @objc dynamic var word = ""
    @objc dynamic var meaning = ""
    @objc dynamic var sentence = ""
    @objc dynamic var pinyin = ""
    @objc dynamic var result = false
    @objc dynamic var level = 0
    @objc dynamic var date = Date()
    
    
}
