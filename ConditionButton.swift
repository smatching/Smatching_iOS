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
    
    //boolean 값을 반전시킴.
    func buttonClicked(sender: UIButton, _ checked : Bool) {
        isClicked = !checked
        
    }
   
    

    
}
