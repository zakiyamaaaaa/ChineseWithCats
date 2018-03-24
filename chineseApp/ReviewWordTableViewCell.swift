//
//  ReviewWordTableViewCell.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/01.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit

class ReviewWordTableViewCell: UITableViewCell {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var pinyinLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
