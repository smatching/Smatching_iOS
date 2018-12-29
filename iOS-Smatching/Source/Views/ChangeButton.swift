//
//  ChangeButton.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 28..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class ChangeButton: UIButton {

        
        var myView = UIView()
        var toolBarView = UIView()
        
        override var inputView: UIView {
            get {
                return self.myView
            }
            
            set {
                self.myView = newValue
                self.becomeFirstResponder()
            }
        }
        
        override var inputAccessoryView: UIView {
            get {
                return self.toolBarView
            }
            set {
                self.toolBarView = newValue
            }
        }
        
        override var canBecomeFirstResponder: Bool {
            return true
        }
        
    
}
