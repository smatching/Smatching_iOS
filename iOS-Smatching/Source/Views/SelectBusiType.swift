//
//  SelectBusiType.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 9..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class SelectBusiType: UIView {
    
    
    
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
   
    @IBAction func okBtnPressed(_ sender: Any) {
        removeFromSuperview()
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        removeFromSuperview()
    }
}
