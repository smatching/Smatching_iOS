//
//  SelectUselessField.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 9..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class SelectUselessField: UIView {

    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
//    class var identifier: String
//    {
//        return "SelectRegionDialog"
//    }
//
//    class func instanceFromNib() -> UIView {
//        return UINib(nibName: self.identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
//    }

    @IBAction func okBtnPressed(_ sender: Any) {
        removeFromSuperview()
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        removeFromSuperview()
    }
}
