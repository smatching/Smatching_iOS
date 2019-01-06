//
//  AlertCheckBox.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 4..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class AlertCheckBox: UIButton {

    let checkedImage = UIImage(named: "icn_checkbox_white")! as UIImage
    let uncheckedImage = UIImage(named: "icn_emptybox")! as UIImage

    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
//        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
//        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
        
    }
    
}
