//
//  CustomSettingVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class CustomSettingVC: UIViewController {
    
    @IBOutlet weak var showDetail: UILabel!
    @IBOutlet weak var titleTxtField: UITextField!
    
    @IBOutlet weak var advanView8: CustomViewBorder!
    @IBOutlet weak var advanView7: CustomViewBorder!
    @IBOutlet weak var advanView6: CustomViewBorder!
    @IBOutlet weak var advanView5: CustomViewBorder!
    @IBOutlet weak var advanView4: CustomViewBorder!
    @IBOutlet weak var advanView3: CustomViewBorder!
    @IBOutlet weak var advanView2: CustomViewBorder!
    @IBOutlet weak var advanView1: CustomViewBorder!
    
    @IBOutlet weak var excView1: CustomViewBorder!
    
    @IBOutlet weak var fieldView1: CustomViewBorder!
    
    @IBOutlet weak var busiView7: CustomViewBorder!
    @IBOutlet weak var busiView6: CustomViewBorder!
    @IBOutlet weak var busiView5: CustomViewBorder!
    @IBOutlet weak var busiView4: CustomViewBorder!
    @IBOutlet weak var busiView3: CustomViewBorder!
    @IBOutlet weak var busiView2: CustomViewBorder!
    @IBOutlet weak var busiView1: CustomViewBorder!
    
    @IBOutlet weak var periodView9: CustomViewBorder!
    @IBOutlet weak var periodView8: CustomViewBorder!
    @IBOutlet weak var periodView7: CustomViewBorder!
    @IBOutlet weak var periodView6: CustomViewBorder!
    @IBOutlet weak var periodView5: CustomViewBorder!
    @IBOutlet weak var periodView4: CustomViewBorder!
    @IBOutlet weak var periodView3: CustomViewBorder!
    @IBOutlet weak var periodView2: CustomViewBorder!
    @IBOutlet weak var periodView1: CustomViewBorder!
    
    
    @IBOutlet weak var periodLabelChange: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initGestureRecognizer()
        UserDefaults.standard.set(0, forKey: "periodCount")
        UserDefaults.standard.set(0, forKey: "busiCount")
        UserDefaults.standard.set(0, forKey: "advanCount")
        
        //uilabel에 tapgesture 추가
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        // here we add it to our custom view
        showDetail.isUserInteractionEnabled = true
        showDetail.addGestureRecognizer(gestureRec)
        
    }
    
    //기업정보 vc로 이동
    @objc func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "InsititutionClassifyInfo")
        self.present(controller!, animated: true, completion: nil)
    }
    
    @IBAction func clearTitle(_ sender: Any) {
        titleTxtField.text = " "
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
        popup.cancelBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside) // 버튼 이벤트 등록
        self.view.addSubview(popup);
    }
    
    @objc func btnClick() -> Void
    {
        
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

