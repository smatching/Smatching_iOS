//
//  CustomDialog.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class CustomDialog: UIView {

    // identifier
    class var identifier: String
    {
        return NSStringFromClass(self)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: self.identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        removeFromSuperview();
    }
    
    @IBAction func okBtn(_ sender: UIButton) {
        
    }

    

}
