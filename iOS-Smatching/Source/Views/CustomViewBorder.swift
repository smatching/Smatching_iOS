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
    
<<<<<<< HEAD
    @IBInspectable override var borderWidth: CGFloat {
=======
    var periodCnt = 0
    var busiCnt = 0
    var advanCnt = 0
    
    var flag = 0
    
    
    
    @IBInspectable var borderWidth: CGFloat {
>>>>>>> 55519f7b273e9de544c7c6374ac257ec67e23d25
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
            flag = 0
            
        } else {
            //선택을 할 경우
            view?.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            flag = 1
        }
        
//        age = UserDefaults.standard.object(forKey: "age") as! Age
//        period = UserDefaults.standard.object(forKey: "period") as! Period
//        busiType = UserDefaults.standard.object(forKey: "busiType") as! BusiType
//        advantage = UserDefaults.standard.object(forKey: "advantage") as! Advantage
        
        
        periodCnt = UserDefaults.standard.integer(forKey: "periodCount")
        
        busiCnt = UserDefaults.standard.integer(forKey: "busiCount")
        
        advanCnt = UserDefaults.standard.integer(forKey: "advanCount")
        
        //선택 해제
        if flag == 0 {
        switch identify {
            case "ageView1":
                age?.twenty_less = !(age?.twenty_less)!
            case "ageView2":
                age?.twenty_forty = !(age?.twenty_forty)!
            case "ageView3":
                age?.forty_more = !(age?.forty_more)!
            case "periodView1":
                period?.zero_one = !(period?.zero_one)!
                periodCnt -= 1
            case "periodView2":
                period?.one_two = !(period?.one_two)!
                periodCnt -= 1
            case "periodView3":
                period?.two_three = !(period?.two_three)!
                periodCnt -= 1
            case "periodView4":
                period?.three_four = !(period?.three_four)!
                periodCnt -= 1
            case "periodView5":
                period?.four_five = !(period?.four_five)!
                periodCnt -= 1
            case "periodView6":
                period?.five_six = !(period?.five_six)!
                periodCnt -= 1
            case "periodView7":
                period?.six_seven = !(period?.six_seven)!
                periodCnt -= 1
            case "periodView8":
                period?.seven_more = !(period?.seven_more)!
                periodCnt -= 1
            case "periodView9":
                period?.yet = !(period?.yet)!
                periodCnt -= 1
            case "busiView1" :
                busiType?.midsmall = !(busiType?.midsmall)!
                busiCnt -= 1
            case "busiView2" :
                busiType?.midbig = !(busiType?.midbig)!
                busiCnt -= 1
            case "busiView3" :
                busiType?.big = !(busiType?.big)!
                busiCnt -= 1
            case "busiView4" :
                busiType?.sole = !(busiType?.sole)!
                busiCnt -= 1
            case "busiView5" :
                busiType?.small = !(busiType?.small)!
                busiCnt -= 1
            case "busiView6" :
                busiType?.tradi = !(busiType?.tradi)!
                busiCnt -= 1
            case "busiView7" :
                busiType?.pre = !(busiType?.pre)!
                busiCnt -= 1
            case "advantageView1":
                advantage?.retry = !(advantage?.retry)!
                advanCnt -= 1
            case "advantageView2":
                advantage?.woman = !(advantage?.woman)!
                advanCnt -= 1
            case "advantageView3":
                advantage?.disabled = !(advantage?.disabled)!
                advanCnt -= 1
            case "advantageView4":
                advantage?.social = !(advantage?.social)!
                advanCnt -= 1
            case "advantageView5":
                advantage?.sole = !(advantage?.sole)!
                advanCnt -= 1
            case "advantageView6":
                advantage?.fourth = !(advantage?.fourth)!
                advanCnt -= 1
            case "advantageView7":
                advantage?.univ = !(advantage?.univ)!
                advanCnt -= 1
            case "advantageView8":
                advantage?.togather = !(advantage?.togather)!
                advanCnt -= 1
            default :
                break
            }
            
        }
        else {
            switch identify {
            case "ageView1":
                age?.twenty_less = !(age?.twenty_less)!
            case "ageView2":
                age?.twenty_forty = !(age?.twenty_forty)!
            case "ageView3":
                age?.forty_more = !(age?.forty_more)!
            case "periodView1":
                period?.zero_one = !(period?.zero_one)!
                periodCnt += 1
            case "periodView2":
                period?.one_two = !(period?.one_two)!
                periodCnt += 1
            case "periodView3":
                period?.two_three = !(period?.two_three)!
                periodCnt += 1
            case "periodView4":
                period?.three_four = !(period?.three_four)!
                periodCnt += 1
            case "periodView5":
                period?.four_five = !(period?.four_five)!
                periodCnt += 1
            case "periodView6":
                period?.five_six = !(period?.five_six)!
                periodCnt += 1
            case "periodView7":
                period?.six_seven = !(period?.six_seven)!
                periodCnt += 1
            case "periodView8":
                period?.seven_more = !(period?.seven_more)!
                periodCnt += 1
            case "periodView9":
                period?.yet = !(period?.yet)!
                periodCnt += 1
            case "busiView1" :
                busiType?.midsmall = !(busiType?.midsmall)!
                busiCnt += 1
            case "busiView2" :
                busiType?.midbig = !(busiType?.midbig)!
                busiCnt += 1
            case "busiView3" :
                busiType?.big = !(busiType?.big)!
                busiCnt += 1
            case "busiView4" :
                busiType?.sole = !(busiType?.sole)!
                busiCnt += 1
            case "busiView5" :
                busiType?.small = !(busiType?.small)!
                busiCnt += 1
            case "busiView6" :
                busiType?.tradi = !(busiType?.tradi)!
                busiCnt += 1
            case "busiView7" :
                busiType?.pre = !(busiType?.pre)!
                busiCnt += 1
            case "advantageView1":
                advantage?.retry = !(advantage?.retry)!
                advanCnt += 1
            case "advantageView2":
                advantage?.woman = !(advantage?.woman)!
                advanCnt += 1
            case "advantageView3":
                advantage?.disabled = !(advantage?.disabled)!
                advanCnt += 1
            case "advantageView4":
                advantage?.social = !(advantage?.social)!
                advanCnt += 1
            case "advantageView5":
                advantage?.sole = !(advantage?.sole)!
                advanCnt += 1
            case "advantageView6":
                advantage?.fourth = !(advantage?.fourth)!
                advanCnt += 1
            case "advantageView7":
                advantage?.univ = !(advantage?.univ)!
                advanCnt += 1
            case "advantageView8":
                advantage?.togather = !(advantage?.togather)!
                advanCnt += 1
            default :
                break
            }
        }
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(advantage, forKey: "advantage")
        UserDefaults.standard.set(busiType, forKey: "busiType")
        UserDefaults.standard.set(period, forKey: "period")
        
        UserDefaults.standard.set(periodCnt, forKey: "periodCount")
        UserDefaults.standard.set(busiCnt, forKey: "busiCount")
        UserDefaults.standard.set(advanCnt, forKey: "advanCount")
        
        print(age?.twenty_forty)
        print(UserDefaults.standard.integer(forKey: "periodCount"))
        print(UserDefaults.standard.integer(forKey: "busiCount"))
        print(UserDefaults.standard.integer(forKey: "advanCount"))
        
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
