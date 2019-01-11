//
//  CustomViewBorder.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 1..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomViewBorder: UIView {
    
    var globalPoint :CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    var globalFrame :CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
    
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
    
    private func initialize() {
        let tapForView = UITapGestureRecognizer(target: self, action: #selector(self.ToChangeColor(recognizer:)))
        tapForView.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapForView)
        
        
    }
    
    @objc func ToChangeColor(recognizer:UITapGestureRecognizer)
    {
        let view = recognizer.view
        
        //선택해제
        if  view?.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            view?.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
           
            
        } else {
            //선택을 할 경우
            view?.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            
        }
    
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    
    
}
