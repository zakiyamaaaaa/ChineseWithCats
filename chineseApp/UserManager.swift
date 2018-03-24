//
//  UserManager.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import RealmSwift

class UserManager{
    
    static var shared = UserManager()
    
    var experience = 0
    var level:Int
    var playTime = 0
    var mode = 0
    var part1 = false
    var part2 = false
    var part3 = false
    var part4 = false
    var part5 = false
    var part6 = false
    var userClass:String
    let beginnerLevel = 1
    let mediumLevel = 10
    let seniorLevel = 30
    let heiestLevel = 100
    var userImage:UIImage
    
    enum className:String {
        case 赤ちゃん級
        case 初級
        case 中級
        case 上級
        case マスタークラス
    }
    
    init() {
//        let config = Realm.Configuration(
//            schemaVersion: 12,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion < 1) {}
//        })
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        if let user = realm.objects(User.self).first{
            experience = user.experience
            playTime = user.playTime
            mode = user.mode
            part1 = user.part1
            part2 = user.part2
            part3 = user.part3
            part4 = user.part4
            part5 = user.part5
            part6 = user.part6
        }
        level = experience/100
        
        //レベルは100まで
        if level >= 100{
            level = 100
        }
        
        switch level {
        case beginnerLevel..<mediumLevel:
            userClass = className.初級.rawValue
            userImage = #imageLiteral(resourceName: "beginner_cat")
        case mediumLevel..<seniorLevel:
            userClass = className.中級.rawValue
            userImage = #imageLiteral(resourceName: "middle_cat")
        case seniorLevel..<heiestLevel:
            userClass = className.上級.rawValue
            userImage = #imageLiteral(resourceName: "senior_cat")
        case heiestLevel:
            userClass = className.マスタークラス.rawValue
            userImage = #imageLiteral(resourceName: "heighest_cat")
        default:
            userClass = className.赤ちゃん級.rawValue
            userImage = #imageLiteral(resourceName: "baby_cat")
        }
    }
}
