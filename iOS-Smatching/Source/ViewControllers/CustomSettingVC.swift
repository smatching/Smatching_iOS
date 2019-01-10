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
    @IBOutlet weak var periodLabelChange: UILabel!
    
    @IBOutlet weak var locationSettingKorea: UIButton!
    @IBOutlet weak var locationSettingIncheon: UIButton!
    @IBOutlet weak var locationSettingDaegu: UIButton!
    @IBOutlet weak var locationSettingBusan: UIButton!
    
    @IBOutlet weak var locationSettingSeoul: UIButton!
    
    @IBOutlet weak var locationBelowBorder: UIView!
    @IBOutlet weak var locationBorderConst: NSLayoutConstraint!
    
    //조건 설정 버튼들
    //지역
    @IBOutlet weak var abroad: AlertCheckBox!
    @IBOutlet weak var local: AlertCheckBox!
    @IBOutlet weak var seoul: AlertCheckBox!
    @IBOutlet weak var jeju: AlertCheckBox!
    @IBOutlet weak var chungbuk: AlertCheckBox!
    @IBOutlet weak var chungnam: AlertCheckBox!
    @IBOutlet weak var jeonbuk: AlertCheckBox!
    @IBOutlet weak var jeonnam: AlertCheckBox!
    @IBOutlet weak var kyungbuk: AlertCheckBox!
    @IBOutlet weak var kyungnam: AlertCheckBox!
    @IBOutlet weak var kyunggi: AlertCheckBox!
    @IBOutlet weak var gangwon: AlertCheckBox!
    @IBOutlet weak var sejong: AlertCheckBox!
    @IBOutlet weak var ulsan: AlertCheckBox!
    @IBOutlet weak var daejeon: AlertCheckBox!
    @IBOutlet weak var gwangju: AlertCheckBox!
    @IBOutlet weak var incheon: AlertCheckBox!
    @IBOutlet weak var daegu: AlertCheckBox!
    @IBOutlet weak var busan: AlertCheckBox!
    
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
    
    var count : Int = 0
    
    var fitConditionRes : FitConditionResponse?
    
    var flag = 0
    
    var cur_cond_idx : Int?
    
    //조건 제목 길이 제한
    let limitLength = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        initView()
        
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
        if age.forty_more == true {
            initialSetting(recognizer: forty_more)
        }
        if age.twenty_forty == true {
            initialSetting(recognizer: twenty_forty)
        }
        if period.zero_one == true {
            initialSetting(recognizer: zero_one)
        }
        if period.one_two == true {
            initialSetting(recognizer: one_two)
        }
        if period.two_three == true {
            initialSetting(recognizer: two_three)
        }
        if period.three_four == true {
            initialSetting(recognizer: three_four)
        }
        if period.four_five == true {
            initialSetting(recognizer: four_five)
        }
        if period.five_six == true {
            initialSetting(recognizer: five_six)
        }
        if period.six_seven == true {
            initialSetting(recognizer: six_seven)
        }
        if busitype.midsmall == true {
            initialSetting(recognizer: midsmall)
        }
        if busitype.midbig == true {
            initialSetting(recognizer: midbig)
        }
        
        if busitype.big == true {
            initialSetting(recognizer: big)
        }
        
        if busitype.sole == true {
            initialSetting(recognizer: sole)
        }
        
        if busitype.small == true {
            initialSetting(recognizer: small)
        }
        
        if busitype.tradi == true {
            initialSetting(recognizer: tradi)
        }
        
        if busitype.pre == true {
            initialSetting(recognizer: pre)
        }
        if advantage.retry == true{
            initialSetting(recognizer: retry)
        }
        if advantage.woman == true{
            initialSetting(recognizer: woman)
        }
        if advantage.disabled == true{
            initialSetting(recognizer: disabled)
        }
        if advantage.social == true{
            initialSetting(recognizer: social)
        }
        if advantage.sole == true{
            initialSetting(recognizer: sole_create)
        }
        if advantage.fourth == true{
            initialSetting(recognizer: fourth)
        }
        if advantage.univ == true{
            initialSetting(recognizer: univ)
        }
        if advantage.togather == true{
            initialSetting(recognizer: together)
        }
        
        locationSettingSeoul.isHidden = true
        locationSettingBusan.isHidden = true
        locationSettingDaegu.isHidden = true
        locationSettingIncheon.isHidden = true
        
        //uilabel에 tapgesture 추가
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        showDetail.isUserInteractionEnabled = true
        showDetail.addGestureRecognizer(gestureRec)
        
        titleTxtField.delegate = self
        
        
    }
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
    
    

    @IBAction func deleteLocationSettingView(_ sender: UIButton) {
        sender.transform =
            CGAffineTransform(scaleX: 0, y: 0)
    }
    func showView() {
        
        if self.location.seoul == true {
            self.locationSettingSeoul.isHidden = !self.locationSettingSeoul.isHidden
            if count == 0 {
                self.locationSettingSeoul.transform = CGAffineTransform.identity
            }
            else {
                    self.locationSettingSeoul.transform = CGAffineTransform(translationX: self.locationSettingSeoul.frame.width + self.locationSettingSeoul.frame.width, y: self.locationSettingSeoul.frame.height)
                
            }
            count += 1
        }
        
        if self.location.busan == true {
            self.locationSettingBusan.isHidden = !self.locationSettingBusan.isHidden
            if count == 0 {
                self.locationSettingBusan.transform = CGAffineTransform.identity
            }
            else {
                self.locationSettingBusan.transform = CGAffineTransform(translationX: self.locationSettingSeoul.frame.width + self.locationSettingBusan.frame.width, y: 0)
            }
            count += 1
            
        }
        if self.location.daegu == true {
            self.locationSettingDaegu.isHidden = false
            if count == 0 {
                self.locationSettingDaegu.transform = CGAffineTransform.identity
            }
            else {
                
                self.locationSettingDaegu.transform = CGAffineTransform(translationX: self.locationSettingSeoul.frame.width + self.locationSettingDaegu.frame.width + self.locationSettingBusan.frame.width, y: 0)
            }
            count += 1
            
        }
        print(count)
        UIView.animate(withDuration: 1.0, animations: ({
            self.locationBorderConst.constant = 43
        }))
    }
    func initView() {
        
        self.locationSettingSeoul.isHidden = true
        self.locationSettingKorea.isHidden = true
        self.locationSettingDaegu.isHidden = true
        self.locationSettingKorea.isHidden = true
        self.locationSettingBusan.isHidden = true
        
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
    

    // 팝업 뷰 3개 Loading (지역, 업종, 필요없는 사업 분야)
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }

    @IBAction func selectRegionBtn(_ sender: Any) {
        startAlert()
    }
    
    func startAlert()
    {
        // 사용자정의 팝업
        let popup: SelectRegionDialog = UINib(nibName: "SelectRegionDialog", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SelectRegionDialog
        popup.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        popup.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        popup.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popup.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside) // 버튼 이벤트 등록
        popup.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside) // 버튼 이벤트 등록
        self.view.addSubview(popup);
        //        self.local.delegate = self
    }
    @IBAction func selectBusiType(_ sender: Any) {
        startAlert1()
    }
    func startAlert1 () {
        if let busiType = Bundle.main.loadNibNamed("BusiTypeBox", owner: self, options: nil)?.first as? SelectBusiType {
            
//            busiType.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
            
            busiType.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            busiType.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)

            
            busiType.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside)
            busiType.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside)
            self.view.addSubview(busiType)
        }
    }

    @IBAction func selectUselessField(_ sender: Any) {
        startAlert2()
    }
    func startAlert2 () {
        if let uselessField = Bundle.main.loadNibNamed("UselessField", owner: self, options: nil)?.first as? SelectUselessField {
            
            uselessField.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
            
            uselessField.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
            uselessField.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            
            uselessField.okBtn.addTarget(self, action: #selector(btnOkClick), for: .touchUpInside)
            uselessField.cancelBtn.addTarget(self, action: #selector(btnCancelClick), for: .touchUpInside)
            self.view.addSubview(uselessField)
        }
    }
    @objc func btnCancelClick() -> Void
    {
        
    }
    
    @objc func btnOkClick() -> Void
    {
        print("okokook")
        showView()
    }
    
    // CheckedBox 개수 검사
    func CountTheCheckedBox (_ parameters: Bool) -> Int{
        if parameters == true {
            return 1
        }else {return -1}
    }
    // CheckedBox 개수 담을 변수 선언
    
     // Pop up view Check Box 이미지 변경
    @IBAction func conditionCheckboxClick(_ sender: AlertCheckBox) {
        switch sender {
        case seoul:
            self.location.seoul = !self.location.seoul!
            sender.isChecked = self.location.seoul!
            break
        case busan:
            self.location.busan = !self.location.busan!
            sender.isChecked = self.location.busan!
            break
        case daegu:
            self.location.daegu = !self.location.daegu!
            sender.isChecked = self.location.daegu!
            break
        case incheon:
            self.location.incheon = !self.location.incheon!
            sender.isChecked = self.location.incheon!
            break
        case gwangju:
            self.location.gwangju = !self.location.gwangju!
            sender.isChecked = self.location.gwangju!
            break
        case daejeon:
            self.location.daejeon = !self.location.daejeon!
            sender.isChecked = self.location.daejeon!
            break
        case ulsan:
            self.location.ulsan = !self.location.ulsan!
            sender.isChecked = self.location.ulsan!
            break
        case sejong:
            self.location.sejong = !self.location.sejong!
            sender.isChecked = self.location.sejong!
            break
        case gangwon:
            self.location.gangwon = !self.location.gangwon!
            sender.isChecked = self.location.gangwon!
            break
        case kyunggi:
            self.location.kyunggi = !self.location.kyunggi!
            sender.isChecked = self.location.kyunggi!
            break
        case kyungnam:
            self.location.kyungnam = !self.location.kyungnam!
            sender.isChecked = self.location.kyungnam!
            break
        case kyungbuk:
            self.location.kyungbuk = !self.location.kyungbuk!
            sender.isChecked = self.location.kyungbuk!
            break
        case jeonbuk:
            self.location.jeonbuk = !self.location.jeonbuk!
            sender.isChecked = self.location.jeonbuk!
            break
        case jeonnam:
            self.location.jeonnam = !self.location.jeonnam!
            sender.isChecked = self.location.jeonnam!
            break
        case chungnam:
            self.location.chungnam = !self.location.chungnam!
            sender.isChecked = self.location.chungnam!
            break
        case chungbuk:
            self.location.chungbuk = !self.location.chungbuk!
            sender.isChecked = self.location.chungbuk!
            break
        case jeju:
            self.location.jeju = !self.location.jeju!
            sender.isChecked = self.location.jeju!
            break
        case local:
            sender.isChecked = !sender.isChecked
            if sender.isChecked == true {
                self.local.setImage(UIImage(named: "icn_checkbox_blue"), for: UIControl.State.normal)
            }
            else {
                self.local.setImage(UIImage(named: "icn_emptybox"), for: UIControl.State.normal)
            }
            self.location.seoul = !self.location.seoul!
            self.seoul.isChecked = self.location.seoul!
            
            self.location.busan = !self.location.busan!
            self.busan.isChecked = self.location.busan!

            self.location.daegu = !self.location.daegu!
            self.daegu.isChecked = self.location.daegu!

            self.location.incheon = !self.location.incheon!
            self.incheon.isChecked = self.location.incheon!
            
            self.location.gwangju = !self.location.gwangju!
            self.gwangju.isChecked = self.location.gwangju!
            
            self.location.daejeon = !self.location.daejeon!
            self.daejeon.isChecked = self.location.daejeon!
            
            self.location.ulsan = !self.location.ulsan!
            self.ulsan.isChecked = self.location.ulsan!
            
            self.location.sejong = !self.location.sejong!
            self.sejong.isChecked = self.location.sejong!

            self.location.gangwon = !self.location.gangwon!
            self.gangwon.isChecked = self.location.gangwon!

            self.location.kyunggi = !self.location.kyunggi!
            self.kyunggi.isChecked = self.location.kyunggi!
            
            self.location.kyungnam = !self.location.kyungnam!
            self.kyungnam.isChecked = self.location.kyungnam!

            self.location.kyungbuk = !self.location.kyungbuk!
            self.kyungbuk.isChecked = self.location.kyungbuk!

            self.location.jeonbuk = !self.location.jeonbuk!
            self.jeonbuk.isChecked = self.location.jeonbuk!

            self.location.jeonnam = !self.location.jeonnam!
            self.jeonnam.isChecked = self.location.jeonnam!

            self.location.chungnam = !self.location.chungnam!
            self.chungnam.isChecked = self.location.chungnam!

            self.location.chungbuk = !self.location.chungbuk!
            self.chungbuk.isChecked = self.location.chungbuk!

            self.location.jeju = !self.location.jeju!
            self.jeju.isChecked = self.location.jeju!
            break
        case abroad:
            sender.isChecked = !sender.isChecked
            
            if sender.isChecked == true {
                self.abroad.setImage(UIImage(named: "icn_checkbox_blue"), for: UIControl.State.normal)
                self.local.setImage(UIImage(named: "icn_emptybox"), for: UIControl.State.normal)
            }
            else {
                self.abroad.setImage(UIImage(named: "icn_emptybox"), for: UIControl.State.normal)
            }
            self.location.seoul = !self.location.seoul!
            self.seoul.isChecked = self.location.seoul!
            
            self.location.busan = !self.location.busan!
            self.busan.isChecked = self.location.busan!
            
            self.location.daegu = !self.location.daegu!
            self.daegu.isChecked = self.location.daegu!
            
            self.location.incheon = !self.location.incheon!
            self.incheon.isChecked = self.location.incheon!
            
            self.location.gwangju = !self.location.gwangju!
            self.gwangju.isChecked = self.location.gwangju!
            
            self.location.daejeon = !self.location.daejeon!
            self.daejeon.isChecked = self.location.daejeon!
            
            self.location.ulsan = !self.location.ulsan!
            self.ulsan.isChecked = self.location.ulsan!
            
            self.location.sejong = !self.location.sejong!
            self.sejong.isChecked = self.location.sejong!
            
            self.location.gangwon = !self.location.gangwon!
            self.gangwon.isChecked = self.location.gangwon!
            
            self.location.kyunggi = !self.location.kyunggi!
            self.kyunggi.isChecked = self.location.kyunggi!
            
            self.location.kyungnam = !self.location.kyungnam!
            self.kyungnam.isChecked = self.location.kyungnam!
            
            self.location.kyungbuk = !self.location.kyungbuk!
            self.kyungbuk.isChecked = self.location.kyungbuk!
            
            self.location.jeonbuk = !self.location.jeonbuk!
            self.jeonbuk.isChecked = self.location.jeonbuk!
            
            self.location.jeonnam = !self.location.jeonnam!
            self.jeonnam.isChecked = self.location.jeonnam!
            
            self.location.chungnam = !self.location.chungnam!
            self.chungnam.isChecked = self.location.chungnam!
            
            self.location.chungbuk = !self.location.chungbuk!
            self.chungbuk.isChecked = self.location.chungbuk!
            
            self.location.jeju = !self.location.jeju!
            self.jeju.isChecked = self.location.jeju!
            break
            
        default:
            break
        }
        print(location)
    }
    
    var BusiTypeCountNum = 0
    
    @IBAction func BusiTypeCheckBoxClicked(_ sender: AlertCheckBox) {
        if BusiTypeCountNum < 6 {
            //switch 구문 실행
            switch (sender) {
            case A:
                self.field.a = !self.field.a!
                sender.isChecked = self.field.a!
                BusiTypeCountNum += CountTheCheckedBox(self.field.a!)
            case B:
                self.field.b = !self.field.b!
                sender.isChecked = self.field.b!
                BusiTypeCountNum += CountTheCheckedBox(self.field.b!)
            case C:
                self.field.c = !self.field.c!
                sender.isChecked = self.field.c!
                BusiTypeCountNum += CountTheCheckedBox(self.field.c!)
            case D:
                self.field.d = !self.field.d!
                sender.isChecked = self.field.d!
                BusiTypeCountNum += CountTheCheckedBox(self.field.d!)
            case E:
                self.field.e = !self.field.e!
                sender.isChecked = self.field.e!
                BusiTypeCountNum += CountTheCheckedBox(self.field.e!)
            case F:
                self.field.f = !self.field.f!
                sender.isChecked = self.field.f!
                BusiTypeCountNum += CountTheCheckedBox(self.field.f!)
            case G:
                self.field.g = !self.field.g!
                sender.isChecked = self.field.g!
                BusiTypeCountNum += CountTheCheckedBox(self.field.g!)
            case H:
                self.field.h = !self.field.h!
                sender.isChecked = self.field.h!
                BusiTypeCountNum += CountTheCheckedBox(self.field.h!)
            case I:
                self.field.i = !self.field.i!
                sender.isChecked = self.field.i!
                BusiTypeCountNum += CountTheCheckedBox(self.field.i!)
            case J:
                self.field.j = !self.field.j!
                sender.isChecked = self.field.j!
                BusiTypeCountNum += CountTheCheckedBox(self.field.j!)
            case K:
                self.field.k = !self.field.k!
                sender.isChecked = self.field.k!
                BusiTypeCountNum += CountTheCheckedBox(self.field.k!)
            case L:
                self.field.l = !self.field.l!
                sender.isChecked = self.field.l!
                BusiTypeCountNum += CountTheCheckedBox(self.field.l!)
            case M:
                self.field.m = !self.field.m!
                sender.isChecked = self.field.m!
                BusiTypeCountNum += CountTheCheckedBox(self.field.m!)
            case N:
                self.field.n = !self.field.n!
                sender.isChecked = self.field.n!
                BusiTypeCountNum += CountTheCheckedBox(self.field.n!)
            case O:
                self.field.o = !self.field.o!
                sender.isChecked = self.field.o!
                BusiTypeCountNum += CountTheCheckedBox(self.field.o!)
            case P:
                self.field.p = !self.field.p!
                sender.isChecked = self.field.p!
                BusiTypeCountNum += CountTheCheckedBox(self.field.p!)
            case Q:
                self.field.q = !self.field.q!
                sender.isChecked = self.field.q!
                BusiTypeCountNum += CountTheCheckedBox(self.field.q!)
            case R:
                self.field.r = !self.field.r!
                sender.isChecked = self.field.r!
                BusiTypeCountNum += CountTheCheckedBox(self.field.r!)
            case S:
                self.field.s = !self.field.s!
                sender.isChecked = self.field.s!
                BusiTypeCountNum += CountTheCheckedBox(self.field.s!)
            case T:
                self.field.t = !self.field.t!
                sender.isChecked = self.field.t!
                BusiTypeCountNum += CountTheCheckedBox(self.field.t!)
            case U:
                self.field.u = !self.field.u!
                sender.isChecked = self.field.u!
                BusiTypeCountNum += CountTheCheckedBox(self.field.u!)
            case V:
                self.field.v = !self.field.v!
                sender.isChecked = self.field.v!
                BusiTypeCountNum += CountTheCheckedBox(self.field.v!)
            default:
                break
            }
        }
        print(field)
    }
    
    var UselessFieldCount = 0
    
    @IBAction func UselessCheckBoxClicked(_ sender: AlertCheckBox) {
        if UselessFieldCount < 5 {
            switch (sender) {
            case edu:
                self.excCategory.edu = !self.excCategory.edu!
                sender.isChecked = self.excCategory.edu!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.edu!)
            case know:
                self.excCategory.know = !self.excCategory.know!
                sender.isChecked = self.excCategory.know!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.know!)
            case place:
                self.excCategory.place = !self.excCategory.place!
                sender.isChecked = self.excCategory.place!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.place!)
            case domestic:
                self.excCategory.local = !self.excCategory.local!
                sender.isChecked = self.excCategory.local!
               UselessFieldCount += CountTheCheckedBox(self.excCategory.local!)
            case global:
                self.excCategory.global = !self.excCategory.global!
                sender.isChecked = self.excCategory.global!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.global!)
            case make:
                self.excCategory.make = !self.excCategory.make!
                sender.isChecked = self.excCategory.make!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.make!)
            case gov:
                self.excCategory.gov = !self.excCategory.gov!
                sender.isChecked = self.excCategory.gov!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.gov!)
            case loan:
                self.excCategory.loan = !self.excCategory.loan!
                sender.isChecked = self.excCategory.loan!
                UselessFieldCount += CountTheCheckedBox(self.excCategory.loan!)
            default:
                break
            }
        } else {
            switch (sender) {
            case edu:
                guard self.excCategory.edu! else {return}
                self.excCategory.edu = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case know:
                guard self.excCategory.know! else {return}
                self.excCategory.know = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case place:
                guard self.excCategory.place! else {return}
                self.excCategory.place = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case domestic:
                guard self.excCategory.local! else {return}
                self.excCategory.local = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case global:
                guard self.excCategory.global! else {return}
                self.excCategory.global = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case make:
                guard self.excCategory.make! else {return}
                self.excCategory.make = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case gov:
                guard self.excCategory.gov! else {return}
                self.excCategory.gov = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            case loan:
                guard self.excCategory.loan! else {return}
                self.excCategory.loan = false
                sender.isChecked = false
                UselessFieldCount += CountTheCheckedBox(false)
                break
            default:
                break
            }
        }
        
        print(excCategory)
    }
    
    // 선택사항 클릭시 박스 border 색 변경
    @IBAction func conditionBtnClick(_ sender: ConditionButton) {
        
        if  sender.layer.borderColor == UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor {
            sender.layer.borderColor = UIColor(displayP3Red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0).cgColor
            
            
        } else {
            //선택을 할 경우
            sender.layer.borderColor = UIColor(displayP3Red: 76/255, green: 130/255, blue: 216/255, alpha: 1.0).cgColor
            
        }
        
        switch(sender){
        case twenty_less:
            self.age.twenty_less = !self.age.twenty_less!
            break
        case twenty_forty:
            self.age.twenty_forty = !self.age.twenty_forty!
            break
        case forty_more:
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
    
    @IBAction func submitCondition(_ sender: Any) {
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
