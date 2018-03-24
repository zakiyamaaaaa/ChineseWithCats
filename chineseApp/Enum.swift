//
//  levelText.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/27.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import UIKit

enum QuizType: Int {
    case level1
    case level2
    case level3
    case level4
    case level5
    
    var bgImage: UIImage {
        switch self {
        case .level1:
            return #imageLiteral(resourceName: "wind-min")
        case .level2:
            return #imageLiteral(resourceName: "hayashi-min")
        case .level3:
            return #imageLiteral(resourceName: "water-min")
        case .level4:
            return #imageLiteral(resourceName: "forest-min")
        case .level5:
            return #imageLiteral(resourceName: "water-min")
        }
    }
    
    var iconImage: UIImage {
        switch self {
        case .level1:
            return #imageLiteral(resourceName: "windIcon")
        case .level2:
            return #imageLiteral(resourceName: "hayashiIcon")
        case .level3:
            return #imageLiteral(resourceName: "fireIcon")
        case .level4:
            return #imageLiteral(resourceName: "mountainIcon")
        case .level5:
            return #imageLiteral(resourceName: "waterIcon")
        }
    }
    
    var defultIconImage: UIImage {
        switch self {
        case .level1:
            return #imageLiteral(resourceName: "windIconDefault")
        case .level2:
            return #imageLiteral(resourceName: "hayashiIconDefault")
        case .level3:
            return #imageLiteral(resourceName: "fireIconDefault")
        case .level4:
            return #imageLiteral(resourceName: "mountainIconDefault")
        case .level5:
            return #imageLiteral(resourceName: "waterIconDefault")
        }
    }
}

