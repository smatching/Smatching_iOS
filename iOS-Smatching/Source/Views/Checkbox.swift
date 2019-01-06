//
//  Checkbox.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
protocol CheckBoxDelegate {
    func checkBoxDidChange(checkbox: Checkbox) -> Void
}

class Checkbox: UIButton {
        // Images
        let checkedImage = UIImage(named: "icn_checkbox_blue")! as UIImage
        let uncheckedImage = UIImage(named: "icn_emptybox")! as UIImage
    
        var delegate: CheckBoxDelegate?
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
            self.addTarget(self, action:Selector("buttonClicked:"), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
        
    func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
        self.delegate?.checkBoxDidChange(checkbox: self)
    }
    

}
