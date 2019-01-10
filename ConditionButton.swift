//
//  ConditionButton.swift
//  
//
//  Created by shineeseo on 2019. 1. 4..
//

import UIKit

class ConditionButton: UIButton {
    @IBInspectable override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    var isClicked = false
    
    func buttonClicked(sender: UIButton) {
        isClicked = !isClicked
    }
    
    

    
}
