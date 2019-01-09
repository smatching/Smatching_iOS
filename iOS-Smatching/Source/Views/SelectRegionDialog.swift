//
//  SelectRegionDialog.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class SelectRegionDialog: UIView {


    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var selectCntLabel: UILabel!
//     identifier
    class var identifier: String
    {
        return "SelectRegionDialog"
    }

    class func instanceFromNib() -> UIView {
        return UINib(nibName: self.identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
         removeFromSuperview();
    }
   
    @IBAction func okBtnPressed(_ sender: Any) {
        removeFromSuperview();
    }
 

}
