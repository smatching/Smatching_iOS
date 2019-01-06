//
//  CustomSettingVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class CustomSettingVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var showDetail: UILabel!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var periodLabelChange: UILabel!
    
    
    @IBOutlet weak var locationSettingRes: UIView!
    
    @IBOutlet weak var locationBelowBorder: UIView!
    @IBOutlet weak var locationBorderConst: NSLayoutConstraint!
    //조건 설정 버튼들
    //지역

    
    @IBOutlet weak var local: Checkbox!
    @IBOutlet weak var abroad: Checkbox!
    @IBOutlet weak var seoul: Checkbox!
    @IBOutlet weak var jeju: Checkbox!
    @IBOutlet weak var chungbuk: Checkbox!
    @IBOutlet weak var chungnam: Checkbox!
    @IBOutlet weak var jeonbuk: Checkbox!
    @IBOutlet weak var jeonnam: Checkbox!
    @IBOutlet weak var kyungbuk: Checkbox!
    @IBOutlet weak var kyungnam: Checkbox!
    @IBOutlet weak var kyunggi: Checkbox!
    @IBOutlet weak var gangwon: Checkbox!
    @IBOutlet weak var sejong: Checkbox!
    @IBOutlet weak var ulsan: Checkbox!
    @IBOutlet weak var daejeon: Checkbox!
    @IBOutlet weak var gwangju: Checkbox!
    @IBOutlet weak var incheon: Checkbox!
    @IBOutlet weak var daegu: Checkbox!
    @IBOutlet weak var busan: Checkbox!
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
    
    var excCategory = ExcCategory(loan: false, edu: false, know: false, global: false, place: false, make: false, local: false, gov: false)
    var field = Field(a: false, b: false, c: false, d: false, e: false, f: false, g:false , h: false, i: false, j: false, k: false, l: false, m: false, n: false, o: false, p: false, q: false, r: false, s: false, t: false, u: false, v: false)
    var location = Location(jeonbuk: false, gangwon: false, gwangju: false, ulsan: false, kyungbuk: false, sejong: false, chungbuk: false, kyungnam: false, seoul: false, chungnam: false, daejeon: false, busan: false, jeju: false, daegu: false, aborad: false, kyunggi: false, incheon: false, jeonnam: false)
    var advantage = Advantage(sole: false, univ: false, woman: false, social: false, disabled: false, togather: false, fourth: false, retry: false)
    var busitype = BusiType(sole: false, small: false, big: false, pre: false, midsmall: false, midbig: false, tradi: false)
    
    var period = Period(three_four: false, six_seven: false, one_two: false, seven_more: false, zero_one: false, four_five: false, yet: false, two_three: false, five_six: false)
    
    var age = Age(twenty_less : false, twenty_forty : false, forty_more : false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGestureRecognizer()
        locationSettingRes.isHidden = true
        //uilabel에 tapgesture 추가
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        // here we add it to our custom view
        showDetail.isUserInteractionEnabled = true
        showDetail.addGestureRecognizer(gestureRec)
        
        titleTxtField.delegate = self
        
        initView()
    }
    
    func showView() {
        self.locationSettingRes.isHidden = false
        self.locationSettingRes.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: 1.0, animations: ({
            self.locationBorderConst.constant = 43
        }))
    }
    func initView() {
        
       self.locationSettingRes.isHidden = true
        self.locationSettingRes.transform =
            CGAffineTransform(scaleX: self.locationSettingRes.frame.width, y: 0)
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
    
    @IBAction func selectRegionBtn(_ sender: Any) {
        startAlert()
    }
    
    func startAlert()
    {
        // 사용자정의 팝업
        let popup: SelectRegionDialog = UINib(nibName: SelectRegionDialog.identifier, bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SelectRegionDialog
        popup.backgroundColor = UIColor.gray.withAlphaComponent(1)
        popup.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        popup.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popup.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside) // 버튼 이벤트 등록
         popup.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside) // 버튼 이벤트 등록
        self.view.addSubview(popup);
        
    }
    
    @objc func btnCancelClick() -> Void
    {
        
    }
    
    @objc func btnOkClick() -> Void
    {
        print("okokook")
        showView()
    }
    @IBAction func conditionCheckboxClick(_ sender: AlertCheckBox) {
        switch sender {
        case seoul:
            self.location.seoul = !self.location.seoul!
            
            break
        case busan:
            self.location.busan = !self.location.busan!
            
            break
        case daegu:
            self.location.daegu = !self.location.daegu!
            
            break
        case incheon:
            self.location.incheon = !self.location.incheon!

            break
        case gwangju:
            self.location.gwangju = !self.location.gwangju!
            
            break
        case daejeon:
            self.location.daejeon = !self.location.daejeon!
            
            break
        case ulsan:
            self.location.ulsan = !self.location.ulsan!
           
            break
        case sejong:
            self.location.sejong = !self.location.sejong!
            
            break
        case gangwon:
            self.location.gangwon = !self.location.gangwon!
            
            break
        case kyunggi:
            self.location.kyunggi = !self.location.kyunggi!
            
            break
        case kyungnam:
            self.location.kyungnam = !self.location.kyungnam!
            
            break
        case kyungbuk:
            self.location.kyungbuk = !self.location.kyungbuk!
            
            break
        case jeonbuk:
            self.location.jeonbuk = !self.location.jeonbuk!
            
            break
        case jeonnam:
            self.location.jeonnam = !self.location.jeonnam!
            
            break
        case chungnam:
            self.location.chungnam = !self.location.chungnam!
            
            break
        case chungbuk:
            self.location.chungbuk = !self.location.chungbuk!
            break
        case jeju:
            self.location.jeju = !self.location.jeju!
            
            break
            
        default:
            break
        }
        print(location)
    }
    
    @IBAction func conditionBtnClick(_ sender: ConditionButton) {
        //        if sender == twenty_less {
        //            print("twenty_less")
        //        }
        
        if  sender.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            sender.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
            
            
        } else {
            //선택을 할 경우
            sender.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            
        }
        switch(sender){
        case twenty_less:
            //buttonOne action
            print("twenty_less")
            self.age.twenty_less = !self.age.twenty_less!
            break
        case twenty_forty:
            //buttonTwo action
            print("twenty_forty")
            self.age.twenty_forty = !self.age.twenty_forty!
            break
        case forty_more:
            //buttonThree action
            print("twenty_more")
            self.age.forty_more = !self.age.forty_more!
            break
        case zero_one:
            self.period.zero_one = !self.period.zero_one!
            break
        case one_two:
            self.period.one_two = !self.period.one_two!
            break
        case two_three:
            self.period.two_three = !self.period.two_three!
            break
        case three_four:
            self.period.three_four = !self.period.three_four!
            break
        case four_five:
            self.period.four_five = !self.period.four_five!
            break
        case five_six:
            self.period.five_six = !self.period.five_six!
            break
        case six_seven:
            self.period.six_seven = !self.period.six_seven!
            break
        case seven_more:
            self.period.seven_more = !self.period.seven_more!
            break
        case yet:
            self.period.yet = !self.period.yet!
            break
        case midsmall:
            self.busitype.midsmall = !self.busitype.midsmall!
            break
        case midbig:
            self.busitype.midbig = !self.busitype.midbig!
            break
        case big:
            self.busitype.big = !self.busitype.big!
            break
        case sole:
            self.busitype.sole = !self.busitype.sole!
            break
        case small:
            self.busitype.small = !self.busitype.small!
            break
        case tradi:
            self.busitype.tradi = !self.busitype.tradi!
            break
        case pre:
            self.busitype.pre = !self.busitype.pre!
            break
        case retry:
            self.advantage.retry = !self.advantage.retry!
            break
        case woman:
            self.advantage.woman = !self.advantage.woman!
            break
        case disabled:
            self.advantage.disabled = !self.advantage.disabled!
            break
        case social:
            self.advantage.social = !self.advantage.social!
            break
        case sole_create:
            self.advantage.sole = !self.advantage.sole!
            break
        case fourth:
            self.advantage.fourth = !self.advantage.fourth!
            break
        case univ:
            self.advantage.univ = !self.advantage.univ!
            break
        case together:
            self.advantage.togather = !self.advantage.togather!
            break
            
        default:
            break
        }
        print(self.advantage)
        print(self.busitype
        )
        print(self.age)
        print(self.period)
    }
    
    
    
    @IBAction func submitCondition(_ sender: Any) {
        ConditionPutService.shared.putFitConditionInfo(condName: self.titleTxtField.text!, location: self.location, age: self.age, period: self.period, field: self.field, advantage: self.advantage, busiType: self.busitype, excCategory: self.excCategory){[weak self] (data) in guard let `self` = self else {return}
            print(data)
        }
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

