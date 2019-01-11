//
//  AlarmCell.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 11..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class AlarmCell: UITableViewCell {

    @IBOutlet weak var noticeValueImg: UIImageView!
    @IBOutlet weak var alarmDateTimeLabel: UILabel!
    @IBOutlet weak var alarmDescripLabel: UILabel!
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
