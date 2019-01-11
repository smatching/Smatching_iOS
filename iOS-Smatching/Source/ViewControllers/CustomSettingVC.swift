//
//  CustomSettingVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//
import UIKit

class CustomSettingVC: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var showDetail: UILabel!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var periodCountLabel: UILabel!
    @IBOutlet weak var busiCountLabel: UILabel!
    @IBOutlet weak var excCountLabel: UILabel!
    @IBOutlet weak var fieldCountLabel: UILabel!
    @IBOutlet weak var advantabeCountLabel: UILabel!
    //조건 설정 버튼들
    
    //나이
    @IBOutlet weak var twenty_less: ConditionButton!
    @IBOutlet weak var twenty_forty: ConditionButton!
    @IBOutlet weak var forty_more: ConditionButton!
    
    //설립경과년수
    @IBOutlet weak var zero_one: ConditionButton!
    @IBOutlet weak var three_four: ConditionButton!
    @IBOutlet weak var two_three: ConditionButton!
    @IBOutlet weak var one_two: ConditionButton!
    @IBOutlet weak var yet: ConditionButton!
    @IBOutlet weak var seven_more: ConditionButton!
    @IBOutlet weak var six_seven: ConditionButton!
    @IBOutlet weak var five_six: ConditionButton!
    @IBOutlet weak var four_five: ConditionButton!
    
    
    //기업 형태
    @IBOutlet weak var midsmall: ConditionButton!
    @IBOutlet weak var pre: ConditionButton!
    @IBOutlet weak var tradi: ConditionButton!
    @IBOutlet weak var small: ConditionButton!
    @IBOutlet weak var sole: ConditionButton!
    @IBOutlet weak var big: ConditionButton!
    @IBOutlet weak var midbig: ConditionButton!
    
    
    //업종
    @IBOutlet weak var A: AlertCheckBox!
    @IBOutlet weak var B: AlertCheckBox!
    @IBOutlet weak var C: AlertCheckBox!
    @IBOutlet weak var D: AlertCheckBox!
    @IBOutlet weak var E: AlertCheckBox!
    @IBOutlet weak var F: AlertCheckBox!
    @IBOutlet weak var G: AlertCheckBox!
    @IBOutlet weak var H: AlertCheckBox!
    @IBOutlet weak var I: AlertCheckBox!
    @IBOutlet weak var J: AlertCheckBox!
    @IBOutlet weak var K: AlertCheckBox!
    @IBOutlet weak var L: AlertCheckBox!
    @IBOutlet weak var M: AlertCheckBox!
    @IBOutlet weak var N: AlertCheckBox!
    @IBOutlet weak var O: AlertCheckBox!
    @IBOutlet weak var P: AlertCheckBox!
    @IBOutlet weak var Q: AlertCheckBox!
    @IBOutlet weak var R: AlertCheckBox!
    @IBOutlet weak var S: AlertCheckBox!
    @IBOutlet weak var T: AlertCheckBox!
    @IBOutlet weak var U: AlertCheckBox!
    @IBOutlet weak var V: AlertCheckBox!
    
    // 필요없는 지원사업 분야
    
    @IBOutlet weak var edu: AlertCheckBox!
    @IBOutlet weak var know: AlertCheckBox!
    @IBOutlet weak var place: AlertCheckBox!
    @IBOutlet weak var domestic: AlertCheckBox!
    
    @IBOutlet weak var global: AlertCheckBox!
    @IBOutlet weak var make: AlertCheckBox!
    @IBOutlet weak var gov: AlertCheckBox!
    @IBOutlet weak var loan: AlertCheckBox!
    
    //필요없는 지원사업 분야 버튼
    
    @IBOutlet weak var eduSettingBtn: UIButton!
    @IBOutlet weak var knowSettingBtn: UIButton!
    @IBOutlet weak var placeSettingBtn: UIButton!
    @IBOutlet weak var domesticSettingBtn: UIButton!
    @IBOutlet weak var globalSettingBtn: UIButton!
    @IBOutlet weak var loanSettingBtn: UIButton!
    @IBOutlet weak var govSettingBtn: UIButton!
    @IBOutlet weak var makeSettingBtn: UIButton!
    
    @IBOutlet weak var excBottomViewConst: NSLayoutConstraint!
    
    //업종 분야 버튼
    @IBOutlet weak var aSettingBtn: UIButton!
    @IBOutlet weak var gSettingBtn: UIButton!
    @IBOutlet weak var fSettingBtn: UIButton!
    @IBOutlet weak var eSettingBtn: UIButton!
    @IBOutlet weak var dSettingBtn: UIButton!
    @IBOutlet weak var hSettingBtn: UIButton!
    @IBOutlet weak var iSettingBtn: UIButton!
    @IBOutlet weak var cSettingBtn: UIButton!
    @IBOutlet weak var bSettingBtn: UIButton!
    
    @IBOutlet weak var fieldBottomViewConst: NSLayoutConstraint!
    
    //우대사항
    @IBOutlet weak var together: ConditionButton!
    @IBOutlet weak var disabled: ConditionButton!
    @IBOutlet weak var social: ConditionButton!
    @IBOutlet weak var sole_create: ConditionButton!
    @IBOutlet weak var fourth: ConditionButton!
    @IBOutlet weak var four: ConditionButton!
    @IBOutlet weak var univ: ConditionButton!
    @IBOutlet weak var woman: ConditionButton!
    @IBOutlet weak var retry: ConditionButton!
    
    @IBOutlet weak var busiTypeButton: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var excCategory = ExcCategory(loan: false, edu: false, know: false, global: false, place: false, make: false, local: false, gov: false)
    var field = Field(a: false, b: false, c: false, d: false, e: false, f: false, g:false , h: false, i: false, j: false, k: false, l: false, m: false, n: false, o: false, p: false, q: false, r: false, s: false, t: false, u: false, v: false)
    var location = Location(jeonbuk: false, gangwon: false, gwangju: false, ulsan: false, kyungbuk: false, sejong: false, chungbuk: false, kyungnam: false, seoul: false, chungnam: false, daejeon: false, busan: false, jeju: false, daegu: false, aborad: false, kyunggi: false, incheon: false, jeonnam: false)
    var advantage = Advantage(sole: false, univ: false, woman: false, social: false, disabled: false, togather: false, fourth: false, retry: false)
    var busitype = BusiType(sole: false, small: false, big: false, pre: false, midsmall: false, midbig: false, tradi: false)
    
    var period = Period(three_four: false, six_seven: false, one_two: false, seven_more: false, zero_one: false, four_five: false, yet: false, two_three: false, five_six: false)
    
    var age = Age(twenty_less : false, twenty_forty : false, forty_more : false)
    
    var count : Int = 0
    
    var fitConditionRes : FitConditionResponse?
    
    var flag = 0
    
    var cur_cond_idx : Int?
    
    var fieldCountNum = 0
    
    var UselessFieldCount = 0
    
    var periodCountNum = 0
    
    var busiTypeCountNum = 0
    
    var advantageCountNum = 0
    
    //조건 제목 길이 제한
    let limitLength = 8
    
    var useLessBtnArray = [UIButton]()
    
    var fieldBtnArray = [UIButton]()
    //필요없는 조건 element : true
    //    var excCategoryMap = [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        initGestureRecognizer()
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        
        if fitConditionRes == nil {
            flag = 0
        } else {
            flag = 1
        }
        
        titleTxtField.text = fitConditionRes?.condName ?? "맞춤조건1"
        
        self.age = fitConditionRes?.age ?? self.age
        self.advantage = fitConditionRes?.advantage ?? self.advantage
        self.location = fitConditionRes?.location ?? self.location
        self.period = fitConditionRes?.period ?? self.period
        self.busitype = fitConditionRes?.busiType ?? self.busitype
        self.field = fitConditionRes?.field ?? self.field
        self.excCategory = fitConditionRes?.excCategory ?? self.excCategory
        
        if age.twenty_less == true {
            initialSetting(recognizer: twenty_less)
        }
        else if age.forty_more == true {
            initialSetting(recognizer: forty_more)
        }
        else if age.twenty_forty == true {
            initialSetting(recognizer: twenty_forty)
        }
        if period.zero_one == true {
            initialSetting(recognizer: zero_one)
            periodCountNum += CountTheCheckedBox(self.period.zero_one!)
        }
        if period.one_two == true {
            initialSetting(recognizer: one_two)
            periodCountNum += CountTheCheckedBox(self.period.one_two!)
        }
        if period.two_three == true {
            initialSetting(recognizer: two_three)
            periodCountNum += CountTheCheckedBox(self.period.two_three!)
        }
        if period.three_four == true {
            initialSetting(recognizer: three_four)
            periodCountNum += CountTheCheckedBox(self.period.three_four!)
        }
        if period.four_five == true {
            initialSetting(recognizer: four_five)
            periodCountNum += CountTheCheckedBox(self.period.four_five!)
        }
        if period.five_six == true {
            initialSetting(recognizer: five_six)
            periodCountNum += CountTheCheckedBox(self.period.five_six!)
        }
        if period.six_seven == true {
            initialSetting(recognizer: six_seven)
            periodCountNum += CountTheCheckedBox(self.period.six_seven!)
        }
        if period.seven_more == true {
            initialSetting(recognizer: seven_more)
            periodCountNum += CountTheCheckedBox(self.period.seven_more!)
        }
        if busitype.midsmall == true {
            initialSetting(recognizer: midsmall)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.midsmall!)
        }
        if busitype.midbig == true {
            initialSetting(recognizer: midbig)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.midbig!)
        }
        
        if busitype.big == true {
            initialSetting(recognizer: big)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.big!)
        }
        
        if busitype.sole == true {
            initialSetting(recognizer: sole)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.sole!)
        }
        
        if busitype.small == true {
            initialSetting(recognizer: small)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.small!)
        }
        
        if busitype.tradi == true {
            initialSetting(recognizer: tradi)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.tradi!)
        }
        
        if busitype.pre == true {
            initialSetting(recognizer: pre)
            busiTypeCountNum += CountTheCheckedBox(self.busitype.pre!)
        }
        if advantage.retry == true{
            initialSetting(recognizer: retry)
            advantageCountNum += CountTheCheckedBox(self.advantage.retry!)
        }
        if advantage.woman == true{
            initialSetting(recognizer: woman)
            advantageCountNum += CountTheCheckedBox(self.advantage.woman!)
        }
        if advantage.disabled == true{
            initialSetting(recognizer: disabled)
            advantageCountNum += CountTheCheckedBox(self.advantage.disabled!)
        }
        if advantage.social == true{
            initialSetting(recognizer: social)
            advantageCountNum += CountTheCheckedBox(self.advantage.social!)
        }
        if advantage.sole == true{
            initialSetting(recognizer: sole_create)
            advantageCountNum += CountTheCheckedBox(self.advantage.sole!)
        }
        if advantage.fourth == true{
            initialSetting(recognizer: fourth)
            advantageCountNum += CountTheCheckedBox(self.advantage.fourth!)
        }
        if advantage.univ == true{
            initialSetting(recognizer: univ)
            advantageCountNum += CountTheCheckedBox(self.advantage.univ!)
        }
        if advantage.togather == true{
            initialSetting(recognizer: together)
            advantageCountNum += CountTheCheckedBox(self.advantage.togather!)
        }
        
        periodCountLabel.text = "\(periodCountNum)/3"
        busiCountLabel.text = "\(busiTypeCountNum)/7"
        advantabeCountLabel.text = "\(advantageCountNum)/8"
    
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
        
        //uilabel에 tapgesture 추가
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        showDetail.isUserInteractionEnabled = true
        showDetail.addGestureRecognizer(gestureRec)
        
        titleTxtField.delegate = self
        
        eduSettingBtn.isHidden = true
        knowSettingBtn.isHidden = true
        placeSettingBtn.isHidden = true
        domesticSettingBtn.isHidden = true
        globalSettingBtn.isHidden = true
        makeSettingBtn.isHidden = true
        govSettingBtn.isHidden = true
        loanSettingBtn.isHidden = true
        
        aSettingBtn.isHidden = true
        bSettingBtn.isHidden = true
        cSettingBtn.isHidden = true
        dSettingBtn.isHidden = true
        eSettingBtn.isHidden = true
        fSettingBtn.isHidden = true
        gSettingBtn.isHidden = true
        hSettingBtn.isHidden = true
        iSettingBtn.isHidden = true
        
    }
    
    //conditionbutton border color setting
    func initialSetting(recognizer : ConditionButton) {
        if  recognizer.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            recognizer.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
        } else {
            //선택을 할 경우
            recognizer.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
    
    //기업정보 vc로 이동
    @objc func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "InsititutionClassifyInfo")
        self.present(controller!, animated: true, completion: nil)
    }
    
    //우측 지우기 버튼
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.applyCustomClearbutton()
        return true
    }
    
    
   //조건 제목 8글자 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
    @IBAction func selectBusiType(_ sender: UIButton) {
        sender.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
        
        startAlert1()
        
    }
    func startAlert1 () {
        if let busiType = Bundle.main.loadNibNamed("BusiTypeBox", owner: self, options: nil)?.first as? SelectBusiType {
            
            //            busiType.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
            
            fieldCountNum = 0
            if field.a == true {
                A.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.a!)
            }
            if field.b == true {
                B.isChecked = true
                conditionFieldButtonSlidingEvent(bSettingBtn,self.field.b! )
                
                fieldCountNum += CountTheCheckedBox(self.field.b!)
            }
            if field.c == true {
                C.isChecked = true
                conditionFieldButtonSlidingEvent(cSettingBtn,self.field.c! )
                
                fieldCountNum += CountTheCheckedBox(self.field.c!)
            }
            if field.d == true {
                D.isChecked = true
                conditionFieldButtonSlidingEvent(dSettingBtn,self.field.d! )
                
                fieldCountNum += CountTheCheckedBox(self.field.d!)
            }
            if field.e == true {
                E.isChecked = true
                conditionFieldButtonSlidingEvent(eSettingBtn,self.field.e! )
                
                fieldCountNum += CountTheCheckedBox(self.field.e!)
            }
            if field.f == true {
                F.isChecked = true
                conditionFieldButtonSlidingEvent(fSettingBtn,self.field.f! )
                
                fieldCountNum += CountTheCheckedBox(self.field.f!)
            }
            if field.g == true {
                H.isChecked = true
                conditionFieldButtonSlidingEvent(gSettingBtn,self.field.g! )
                
                fieldCountNum += CountTheCheckedBox(self.field.g!)
            }
            if field.h == true {
                H.isChecked = true
                conditionFieldButtonSlidingEvent(hSettingBtn,self.field.h! )
                
                fieldCountNum += CountTheCheckedBox(self.field.h!)
            }
            if field.i == true {
                I.isChecked = true
                conditionFieldButtonSlidingEvent(iSettingBtn,self.field.i! )
                
                fieldCountNum += CountTheCheckedBox(self.field.i!)
            }
            if field.j == true {
                J.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.j!)
            }
            if field.k == true {
                K.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.k!)
            }
            if field.l == true {
                L.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.l!)
            }
            if field.m == true {
                M.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.m!)
            }
            if field.n == true {
                N.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                
                fieldCountNum += CountTheCheckedBox(self.field.n!)
            }
            if field.o == true {
                O.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.o!)
            }
            if field.p == true {
                P.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.p!)
            }
            if field.q == true {
                Q.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.q!)
            }
            if field.r == true {
                R.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.r!)
            }
            if field.s == true {
                S.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.s!)
            }
            if field.t == true {
                T.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.t!)
            }
            if field.u == true {
                U.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.u!)
            }
            if field.v == true {
                V.isChecked = true
                conditionFieldButtonSlidingEvent(aSettingBtn,self.field.a! )
                fieldCountNum += CountTheCheckedBox(self.field.v!)
            }
            
            UIView.animate(withDuration: 0.2, animations: ({
                self.fieldBottomViewConst.constant = CGFloat(32 * self.fieldCountNum)
                self.view.layoutIfNeeded()
            }))
            
            self.fieldCountLabel.text = "\(fieldCountNum)/6"
            
            busiType.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            busiType.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            busiType.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside)
            busiType.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside)
            self.view.addSubview(busiType)
            
            if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
                submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
            }
        }
    }
    
    @IBAction func selectUselessField(_ sender: UIButton) {
        self.busiTypeButton.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
        
        startAlert2()
    }
    func startAlert2 () {
        if let uselessField = Bundle.main.loadNibNamed("UselessField", owner: self, options: nil)?.first as? SelectUselessField {
            
            UselessFieldCount = 0
            if excCategory.edu == true {
                edu.isChecked = self.excCategory.edu!
                conditionButtonSlidingEvent(eduSettingBtn,self.excCategory.edu! )
                UselessFieldCount += CountTheCheckedBox(self.excCategory.edu!)
            }
            if excCategory.global == true {
                global.isChecked = self.excCategory.global!
                conditionButtonSlidingEvent(globalSettingBtn, self.excCategory.global!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.global!)
            }
            if excCategory.gov == true {
                gov.isChecked = self.excCategory.gov!
                conditionButtonSlidingEvent(govSettingBtn, self.excCategory.gov!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.gov!)
            }
            if excCategory.know == true {
                know.isChecked = excCategory.know!
                conditionButtonSlidingEvent(knowSettingBtn, self.excCategory.know!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.know!)
            }
            if excCategory.loan == true {
                loan.isChecked = excCategory.loan!
                conditionButtonSlidingEvent(loanSettingBtn, self.excCategory.loan!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.loan!)
            }
            if excCategory.make == true {
                make.isChecked = excCategory.make!
                conditionButtonSlidingEvent(makeSettingBtn, self.excCategory.make!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.make!)
            }
            if excCategory.place == true {
                place.isChecked = excCategory.place!
                conditionButtonSlidingEvent(placeSettingBtn, self.excCategory.place!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.place!)
            }
            if excCategory.local == true {
                domestic.isChecked = excCategory.local!
                conditionButtonSlidingEvent(domesticSettingBtn, self.excCategory.local!)
                UselessFieldCount += CountTheCheckedBox(self.excCategory.local!)
            }
            
            UIView.animate(withDuration: 0.2, animations: ({
                self.excBottomViewConst.constant = CGFloat(32 * self.UselessFieldCount)
                self.view.layoutIfNeeded()
            }))
            
            self.excCountLabel.text = "\(UselessFieldCount)/5"
            uselessField.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
            
            uselessField.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            uselessField.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            
            uselessField.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside)
            uselessField.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside)
            self.view.addSubview(uselessField)
        }
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
    }
    @objc func btnCancelClick() -> Void
    {
        
    }
    
    @objc func btnOkClick() -> Void
    {
        print("okokook")
        
    }
    
    // CheckedBox 개수 검사
    func CountTheCheckedBox (_ parameters: Bool) -> Int{
        if parameters == true {
            return 1
        }else {
            return -1
        }
    }
    
    func CountTheCheckedBoxReverse (_ parameters: Bool) -> Int{
        if parameters == true {
            return -1
        }else {return 1}
    }

    @IBAction func BusiTypeCheckBoxClicked(_ sender: AlertCheckBox) {
        if fieldCountNum < 6 {
            //switch 구문 실행
            checkboxBtnClickEvent(sender)
        } else {
            guard sender.isChecked else {return}
            checkboxBtnClickEvent(sender)
        }
        print(fieldCountNum)
        print(field)
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
    }
    
    
    @IBAction func UselessCheckBoxClicked(_ sender: AlertCheckBox) {
        if UselessFieldCount < 5 {
            checkboxBtnClickEvent(sender)
        } else {
            guard sender.isChecked else {return}
            checkboxBtnClickEvent(sender)
        }
        print(UselessFieldCount)
        print(excCategory)
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
    }
    
    @IBAction func deleteLocationSettingView(_ sender: UIButton) {
        if sender == eduSettingBtn {
            excCategory.edu = !excCategory.edu!
        }
        else if sender == knowSettingBtn{
            excCategory.know = !excCategory.know!
        }
        else if sender == placeSettingBtn {
            excCategory.place = !excCategory.place!
        }
        else if sender == domesticSettingBtn {
            excCategory.local = !excCategory.local!
        }
        else if sender == globalSettingBtn {
            excCategory.global = !excCategory.global!
        }
        else if sender == makeSettingBtn {
            excCategory.make = !excCategory.make!
        }
        else if sender == govSettingBtn {
            excCategory.gov = !excCategory.gov!
        }
        else if sender == loanSettingBtn {
            excCategory.loan = !excCategory.loan!
        }
        else {}
        sender.isHidden = !sender.isHidden
        sender.transform =
            CGAffineTransform(scaleX: 0, y: 0)
        let index = useLessBtnArray.index(of: sender)!
        if index != useLessBtnArray.count-1{
            self.slideY(y: CGFloat(useLessBtnArray[index].frame.origin.y), sender : useLessBtnArray[index+1])
        }
        useLessBtnArray.remove(at: index)
    }
    
    @IBAction func deleteFieldSettingView(_ sender: UIButton) {
        if sender == aSettingBtn {
            field.a = !field.a!
        }
        else  if sender == bSettingBtn {
            field.b = !field.b!
        }
        else  if sender == cSettingBtn {
            field.c = !field.c!
        }
        else  if sender == dSettingBtn {
            field.d = !field.d!
        }
        else  if sender == eSettingBtn {
            field.e = !field.e!
        }
        else  if sender == fSettingBtn {
            field.f = !field.f!
        }
        else  if sender == gSettingBtn {
            field.g = !field.g!
        }
        else  if sender == hSettingBtn {
            field.h = !field.h!
        }
        else  if sender == iSettingBtn {
            field.i = !field.i!
        }
        else {}
        sender.isHidden = !sender.isHidden
        sender.transform =
            CGAffineTransform(scaleX: 0, y: 0)
        let index = fieldBtnArray.index(of: sender)!
        if index != fieldBtnArray.count-1{
            self.slideY(y: CGFloat(fieldBtnArray[index].frame.origin.y), sender : fieldBtnArray[index+1])
        }
        fieldBtnArray.remove(at: index)
    }
    
    func conditionFieldButtonSlidingEvent(_ sender : UIButton, _ checked : Bool) {
        sender.isHidden = !checked
         self.slideY(y: CGFloat(sender.frame.origin.y), sender : sender)
//        self.slideY(y: CGFloat(758 + 32 * fieldCountNum), sender : sender)
        fieldBtnArray.append(sender)
        
    }
    
    func conditionButtonSlidingEvent(_ sender : UIButton, _ checked : Bool) {
        sender.isHidden = !checked
        self.slideY(y: CGFloat(863 + 32 * UselessFieldCount), sender : sender)
        useLessBtnArray.append(sender)
        
    }
    
    func checkboxBtnClickEvent(_ sender : AlertCheckBox) {
        switch (sender) {
        case edu:
            self.excCategory.edu = !self.excCategory.edu!
            sender.isChecked = self.excCategory.edu!
            conditionButtonSlidingEvent(eduSettingBtn,self.excCategory.edu! )
            UselessFieldCount += CountTheCheckedBox(self.excCategory.edu!)
            
            break
        case know:
            self.excCategory.know = !self.excCategory.know!
            sender.isChecked = self.excCategory.know!
            conditionButtonSlidingEvent(knowSettingBtn, self.excCategory.know!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.know!)
            
            break
        case place:
            self.excCategory.place = !self.excCategory.place!
            sender.isChecked = self.excCategory.place!
            conditionButtonSlidingEvent(placeSettingBtn,self.excCategory.place!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.place!)
            break
        case domestic:
            self.excCategory.local = !self.excCategory.local!
            sender.isChecked = self.excCategory.local!
            conditionButtonSlidingEvent(domesticSettingBtn,self.excCategory.local!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.local!)
            
            break
        case global:
            self.excCategory.global = !self.excCategory.global!
            sender.isChecked = self.excCategory.global!
            conditionButtonSlidingEvent(globalSettingBtn, self.excCategory.global!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.global!)
            break
        case make:
            self.excCategory.make = !self.excCategory.make!
            sender.isChecked = self.excCategory.make!
            conditionButtonSlidingEvent(makeSettingBtn, self.excCategory.make!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.make!)
            break
        case gov:
            self.excCategory.gov = !self.excCategory.gov!
            sender.isChecked = self.excCategory.gov!
            conditionButtonSlidingEvent(govSettingBtn, self.excCategory.gov!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.gov!)
            break
        case loan:
            self.excCategory.loan = !self.excCategory.loan!
            sender.isChecked = self.excCategory.loan!
            conditionButtonSlidingEvent(loanSettingBtn, self.excCategory.loan!)
            UselessFieldCount += CountTheCheckedBox(self.excCategory.loan!)
            break
        case A:
            self.field.a = !self.field.a!
            sender.isChecked = self.field.a!
            conditionFieldButtonSlidingEvent(aSettingBtn, self.field.a!)
            fieldCountNum += CountTheCheckedBox(self.field.a!)
            break
        case B:
            self.field.b = !self.field.b!
            sender.isChecked = self.field.b!
            conditionFieldButtonSlidingEvent(bSettingBtn, self.field.b!)
            fieldCountNum += CountTheCheckedBox(self.field.b!)
            break
        case C:
            self.field.c = !self.field.c!
            sender.isChecked = self.field.c!
            conditionFieldButtonSlidingEvent(cSettingBtn, self.field.c!)
            fieldCountNum += CountTheCheckedBox(self.field.c!)
            break
        case D:
            self.field.d = !self.field.d!
            sender.isChecked = self.field.d!
            conditionFieldButtonSlidingEvent(dSettingBtn, self.field.d!)
            fieldCountNum += CountTheCheckedBox(self.field.d!)
            break
        case E:
            self.field.e = !self.field.e!
            sender.isChecked = self.field.e!
            conditionFieldButtonSlidingEvent(eSettingBtn, self.field.e!)
            fieldCountNum += CountTheCheckedBox(self.field.e!)
            break
        case F:
            self.field.f = !self.field.f!
            sender.isChecked = self.field.f!
            conditionFieldButtonSlidingEvent(fSettingBtn, self.field.f!)
            fieldCountNum += CountTheCheckedBox(self.field.f!)
            break
        case G:
            self.field.g = !self.field.g!
            sender.isChecked = self.field.g!
            conditionFieldButtonSlidingEvent(gSettingBtn, self.field.g!)
            fieldCountNum += CountTheCheckedBox(self.field.g!)
            break
        case H:
            self.field.h = !self.field.h!
            sender.isChecked = self.field.h!
            conditionFieldButtonSlidingEvent(hSettingBtn, self.field.h!)
            fieldCountNum += CountTheCheckedBox(self.field.h!)
            break
        case I:
            self.field.i = !self.field.i!
            sender.isChecked = self.field.i!
            conditionFieldButtonSlidingEvent(iSettingBtn, self.field.i!)
            fieldCountNum += CountTheCheckedBox(self.field.i!)
            break
        case J:
            self.field.j = !self.field.j!
            sender.isChecked = self.field.j!
            fieldCountNum += CountTheCheckedBox(self.field.j!)
            break
        case K:
            self.field.k = !self.field.k!
            sender.isChecked = self.field.k!
            fieldCountNum += CountTheCheckedBox(self.field.k!)
            break
        case L:
            self.field.l = !self.field.l!
            sender.isChecked = self.field.l!
            fieldCountNum += CountTheCheckedBox(self.field.l!)
            break
        case M:
            self.field.m = !self.field.m!
            sender.isChecked = self.field.m!
            fieldCountNum += CountTheCheckedBox(self.field.m!)
            break
        case N:
            self.field.n = !self.field.n!
            sender.isChecked = self.field.n!
            fieldCountNum += CountTheCheckedBox(self.field.n!)
            break
        case O:
            self.field.o = !self.field.o!
            sender.isChecked = self.field.o!
            fieldCountNum += CountTheCheckedBox(self.field.o!)
            break
        case P:
            self.field.p = !self.field.p!
            sender.isChecked = self.field.p!
            fieldCountNum += CountTheCheckedBox(self.field.p!)
            break
        case Q:
            self.field.q = !self.field.q!
            sender.isChecked = self.field.q!
            fieldCountNum += CountTheCheckedBox(self.field.q!)
            break
        case R:
            self.field.r = !self.field.r!
            sender.isChecked = self.field.r!
            fieldCountNum += CountTheCheckedBox(self.field.r!)
            break
        case S:
            self.field.s = !self.field.s!
            sender.isChecked = self.field.s!
            fieldCountNum += CountTheCheckedBox(self.field.s!)
            break
        case T:
            self.field.t = !self.field.t!
            sender.isChecked = self.field.t!
            fieldCountNum += CountTheCheckedBox(self.field.t!)
            break
        case U:
            self.field.u = !self.field.u!
            sender.isChecked = self.field.u!
            fieldCountNum += CountTheCheckedBox(self.field.u!)
            break
        case V:
            self.field.v = !self.field.v!
            sender.isChecked = self.field.v!
            fieldCountNum += CountTheCheckedBox(self.field.v!)
            break
        default:
            break
        }
        
        UIView.animate(withDuration: 0.2, animations: ({
            self.excBottomViewConst.constant = CGFloat(32 * self.UselessFieldCount)
            self.view.layoutIfNeeded()
        }))
        UIView.animate(withDuration: 0.2, animations: ({
            self.fieldBottomViewConst.constant = CGFloat(32 * self.fieldCountNum)
            self.view.layoutIfNeeded()
        }))
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
    }
    
    func clickPeriodConditionButton(_ sender : ConditionButton) {
        if periodCountNum < 3 {
            switch(sender){
            case zero_one:
                self.period.zero_one = !self.period.zero_one!
                periodCountNum += CountTheCheckedBox(self.period.zero_one!)
                break
            case one_two:
                self.period.one_two = !self.period.one_two!
                periodCountNum += CountTheCheckedBox(self.period.one_two!)
                break
            case two_three:
                self.period.two_three = !self.period.two_three!
                periodCountNum += CountTheCheckedBox(self.period.two_three!)
                break
            case three_four:
                self.period.three_four = !self.period.three_four!
                periodCountNum += CountTheCheckedBox(self.period.three_four!)
                break
            case four_five:
                self.period.four_five = !self.period.four_five!
                periodCountNum += CountTheCheckedBox(self.period.four_five!)
                break
            case five_six:
                self.period.five_six = !self.period.five_six!
                periodCountNum += CountTheCheckedBox(self.period.five_six!)
                break
            case six_seven:
                self.period.six_seven = !self.period.six_seven!
                periodCountNum += CountTheCheckedBox(self.period.six_seven!)
                break
            case seven_more:
                self.period.seven_more = !self.period.seven_more!
                periodCountNum += CountTheCheckedBox(self.period.seven_more!)
                break
            case yet:
                self.period.yet = !self.period.yet!
                periodCountNum += CountTheCheckedBox(self.period.yet!)
                break
                
            default:
                break
            }
            
        } else {
            switch(sender){
            
            case zero_one:
               
                periodCountNum += CountTheCheckedBoxReverse(self.period.zero_one!)
                 self.period.zero_one = !self.period.zero_one!
                break
            case one_two:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.one_two!)
                self.period.one_two = !self.period.one_two!
                break
            case two_three:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.two_three!)
                self.period.two_three = !self.period.two_three!
                break
            case three_four:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.three_four!)
                self.period.three_four = !self.period.three_four!
                break
            case four_five:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.four_five!)
                self.period.four_five = !self.period.four_five!
                break
            case five_six:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.five_six!)
                self.period.five_six = !self.period.five_six!
                break
            case six_seven:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.six_seven!)
                self.period.six_seven = !self.period.six_seven!
                break
            case seven_more:
               
                periodCountNum += CountTheCheckedBoxReverse(self.period.seven_more!)
                 self.period.seven_more = !self.period.seven_more!
                break
            case yet:
                
                periodCountNum += CountTheCheckedBoxReverse(self.period.yet!)
                self.period.yet = !self.period.yet!
                break
                
            default:
                break
            }
        }
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
    }
    
    //버튼 border 색 바꾸기
    func conditionBorderColorChange(_ sender : ConditionButton) {
        if  sender.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            sender.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
            //                sender.isClicked = true
            
        }
        else {
            //선택을 할 경우
            sender.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            
        }
    }
    // 선택사항 클릭시 박스 border 색 변경
    @IBAction func conditionPeriodBtnClick(_ sender: ConditionButton) {
        
        if sender == twenty_less {
            self.age.twenty_less = !self.age.twenty_less!
            self.twenty_less.buttonClicked(sender: twenty_less, self.age.twenty_less!)
            
        }
        else if sender == twenty_forty {
            self.age.twenty_forty = !self.age.twenty_forty!
            self.twenty_forty.buttonClicked(sender: twenty_forty, self.age.twenty_forty!)
        }
        else if sender == forty_more {
            self.age.forty_more = !self.age.forty_more!
            self.forty_more.buttonClicked(sender: forty_more, self.age.forty_more!)
        }
        conditionBorderColorChange(sender)
        //perIOD 제한 3
        clickPeriodConditionButton(sender)
        
    }
    
    @IBAction func conditionElseBtnClick(_ sender: ConditionButton) {
        clickElseConditionButton(sender)
    }
    
    
    func clickElseConditionButton(_ sender : ConditionButton){
        switch sender {
        case midsmall:
            self.busitype.midsmall = !self.busitype.midsmall!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.midsmall!)
            break
        case midbig:
            self.busitype.midbig = !self.busitype.midbig!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.midbig!)
            break
        case big:
            self.busitype.big = !self.busitype.big!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.big!)
            break
        case sole:
            self.busitype.sole = !self.busitype.sole!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.sole!)
            
            break
        case small:
            self.busitype.small = !self.busitype.small!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.small!)
            break
        case tradi:
            self.busitype.tradi = !self.busitype.tradi!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.tradi!)
            break
        case pre:
            self.busitype.pre = !self.busitype.pre!
            busiTypeCountNum += CountTheCheckedBox(self.busitype.pre!)
            break
        case retry:
            self.advantage.retry = !self.advantage.retry!
            advantageCountNum += CountTheCheckedBox(self.advantage.retry!)
            break
        case woman:
            self.advantage.woman = !self.advantage.woman!
            advantageCountNum += CountTheCheckedBox(self.advantage.woman!)
            break
        case disabled:
            self.advantage.disabled = !self.advantage.disabled!
            advantageCountNum += CountTheCheckedBox(self.advantage.disabled!)
            break
        case social:
            self.advantage.social = !self.advantage.social!
            advantageCountNum += CountTheCheckedBox(self.advantage.social!)
            break
        case sole_create:
            self.advantage.sole = !self.advantage.sole!
            advantageCountNum += CountTheCheckedBox(self.advantage.sole!)
            break
        case fourth:
            self.advantage.fourth = !self.advantage.fourth!
            advantageCountNum += CountTheCheckedBox(self.advantage.fourth!)
            break
        case univ:
            self.advantage.univ = !self.advantage.univ!
            advantageCountNum += CountTheCheckedBox(self.advantage.univ!)
            break
        case together:
            self.advantage.togather = !self.advantage.togather!
            advantageCountNum += CountTheCheckedBox(self.advantage.togather!)
            break
            
        default:
            break
        }
        conditionBorderColorChange(sender)
        
        if periodCountNum != 0 && busiTypeCountNum != 0 && fieldCountNum != 0 && UselessFieldCount != 0 {
            submitBtn.backgroundColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0)
        }
        
    }
    
    @IBAction func deleteAllConditions(_ sender: Any) {
        
        simpleAlert("", "삭제하시겠습니까?",  completion: { (action) in
            ConditionPutService.shared.deleteFitConditionInfo(cond_idx: self.gino(self.cur_cond_idx)) {[weak self] () in guard let `self` = self else {return}
                print("delete!!")
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func submitCondition(_ sender: UIButton) {
        
        print(flag)
        if flag == 0 {
            ConditionPutService.shared.postFitConditionInfo(condName: self.titleTxtField.text!, location: self.location, age: self.age, period: self.period, field: self.field, advantage: self.advantage, busiType: self.busitype, excCategory: self.excCategory){[weak self] (data) in guard let `self` = self else {return}
                
                self.cur_cond_idx = self.gino(data.condIdx)
            }
        }
        else {
            ConditionPutService.shared.putFitConditionInfo(condIdx: self.gino(self.cur_cond_idx!), condName: self.titleTxtField.text!, location: self.location, age: self.age, period: self.period, field: self.field, advantage: self.advantage, busiType: self.busitype, excCategory: self.excCategory) {[weak self] (data) in guard let `self` = self else {return}
                
                self.cur_cond_idx = self.gino(data.condIdx)
            }
        }
        if let presenter = CustomSettingVC() as? SmatchingListVC     {
            presenter.cur_cond_idx = self.gino(self.cur_cond_idx)
        }
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
extension CustomSettingVC: UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.titleTxtField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: titleTxtField))! {
            return false
        }
        
        return true
    }
    func registerForKeyboardNotifications() {
        //addObserver - 특정 동작에 selector추가 -> 계속 지켜보고 있으면서 특정 상황이 오면 실행된다.
        //addObserver - 다른 view controller로 가기 전에 이걸 없애줘야 한다. removeObserver
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        self.view.layoutIfNeeded()
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        self.view.layoutIfNeeded()
    }
    
}
