//
//  Checkbox.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class Checkbox: UIButton {
        // Images
        let checkedImage = UIImage(named: "ic_check_box")! as UIImage
        let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")! as UIImage
        
        // Bool property
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
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
        
    @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    

}
