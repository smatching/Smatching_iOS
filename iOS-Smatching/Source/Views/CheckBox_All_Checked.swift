//
//  CheckBox_All_Checked.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class CheckBox_All_Checked: UIButton {

    override func awakeFromNib() {
        self.setImage(UIImage(named:"icn_checkbox_blue"), for: .selected)
        self.setImage(UIImage(named:"icn_emptybox"), for: .normal)
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        
        
        self.isSelected = !self.isSelected
    }

}
