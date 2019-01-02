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
    
    var age : Age?
    var advantage : Advantage?
    var busiType : BusiType?
    var period : Period?
    
    @IBInspectable var borderWidth: CGFloat {
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
        let identify = view!.accessibilityIdentifier
        
        //선택해제
        if  view?.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            view?.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
        } else {
            //선택을 할 경우
            view?.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            switch identify {
            case "ageView1":
                age?.twenty_less = !(age?.twenty_less)!
            case "ageView2":
                age?.twenty_forty = !(age?.twenty_forty)!
            case "ageView3":
                age?.forty_more = !(age?.forty_more)!
            case "periodView1":
                period?.zero_one = !(period?.zero_one)!
            case "periodView2":
                period?.one_two = !(period?.one_two)!
            case "periodView3":
                period?.two_three = !(period?.two_three)!
            case "periodView4":
                period?.three_four = !(period?.three_four)!
            case "periodView5":
                period?.four_five = !(period?.four_five)!
            case "periodView6":
                period?.five_six = !(period?.five_six)!
            case "periodView7":
                period?.six_seven = !(period?.six_seven)!
            case "periodView8":
                period?.seven_more = !(period?.seven_more)!
            case "periodView9":
                period?.yet = !(period?.yet)!
            case "busiView1" :
                busiType?.midsmall = !(busiType?.midsmall)!
            case "busiView2" :
                busiType?.midbig = !(busiType?.midbig)!
            case "busiView3" :
                busiType?.big = !(busiType?.big)!
            case "busiView4" :
                busiType?.sole = !(busiType?.sole)!
            case "busiView5" :
                busiType?.small = !(busiType?.small)!
            case "busiView6" :
                busiType?.tradi = !(busiType?.tradi)!
            case "busiView7" :
                busiType?.pre = !(busiType?.pre)!
            case "advantageView1":
                advantage?.retry = !(advantage?.retry)!
            case "advantageView2":
                advantage?.woman = !(advantage?.woman)!
            case "advantageView3":
                advantage?.disabled = !(advantage?.disabled)!
            case "advantageView4":
                advantage?.social = !(advantage?.social)!
            case "advantageView5":
                advantage?.sole = !(advantage?.sole)!
            case "advantageView6":
                advantage?.fourth = !(advantage?.fourth)!
            case "advantageView7":
                advantage?.univ = !(advantage?.univ)!
            case "advantageView8":
                advantage?.togather = !(advantage?.togather)!
            default :
                break
            }
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
