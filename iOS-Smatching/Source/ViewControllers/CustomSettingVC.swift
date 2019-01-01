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
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        // here we add it to our custom view
        showDetail.isUserInteractionEnabled = true
        showDetail.addGestureRecognizer(gestureRec)
    }

    @objc func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "InsititutionClassifyInfo")
        self.present(controller!, animated: true, completion: nil)
        // swift 2
        // self.presentViewController(controller, animated: true, completion: nil)
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
        popup.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
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
        
        //stacview의 constraint의 constant값을 변경시킴
        //위로 올림 -> - 값
        //        stackViewConstraint.constant = -120
        
        
        self.view.layoutIfNeeded()
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
    
        
        //        stackViewConstraint.constant = 0
        
        self.view.layoutIfNeeded()
    }
    
}

