//
//  LoginViewController.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
import Lottie

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var stackViewConst: NSLayoutConstraint!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwdTxtField: UITextField!
    
    @IBOutlet weak var loginDeactiveBtn: UIButton!
    @IBOutlet weak var loginActiveBtn: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "btnBack")
        initGestureRecognizer()
        
        textFieldAddTarget(emailTxtField)
        textFieldAddTarget(passwdTxtField)
        
        loginDeactiveBtn.isHidden = false
        loginActiveBtn.isHidden = true
        
        emailTxtField.delegate = self
        passwdTxtField.delegate = self
    
        // 초기 TextField BorderColor 정하기
        LightGrayTextField(emailTxtField)
        LightGrayTextField(passwdTxtField)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }

    //textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard emailTxtField.text?.isEmpty != true else {return false}
        guard emailTxtField.text!.validateEmail() == true else {
            emailTxtField.text = "이메일 형식 틀림"
            return false}
        guard passwdTxtField.text?.isEmpty != true else {return false}
        
        loginActiveBtn.isHidden = false;
        loginDeactiveBtn.isHidden = true;
        return true
    }
    
    //로그인 기능 실행
    @IBAction func login(_ sender: Any) {
        LoginService.shared.login(email : emailTxtField.text!, password : passwdTxtField.text! ) {[weak self] (token) in guard let `self` = self else {return}
            print(token.token)
            UserDefaults.standard.set(self.gsno(token.token), forKey: "token")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
        
    }
    
    // TextField borderColor 변경
    // Text 입력 중엔 민트색, Text없을시 lightgray
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        BlueTextField(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if textField.text?.isEmpty == true {
            LightGrayTextField(textField)
        } else {
            BlueTextField(textField)

        }
    }
    
    //우측 지우기 버튼
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.applyCustomClearbutton()
        return true
    }
    
    // TextField Tap할 때 placeholder 지우기/ borderColor 지정
    func textFieldAddTarget (_ textField: UITextField) {
        textField.addTarget(self, action: #selector(whenTxtFieldTapped(_:)), for: UIControl.Event.touchDown)
    }
    @objc func whenTxtFieldTapped (_ textField: UITextField) {
        BlueTextField(textField)
        textField.placeholder = ""
    }
    // TextField 색깔 지정 함수
    func BlueTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1).cgColor
    }
    func LightGrayTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
extension LoginViewController : UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.emailTxtField.resignFirstResponder()
        self.passwdTxtField.resignFirstResponder()
    }
    //탭 제스쳐가 먹히는 상황과 아닌 상황을 판단
    //UIGestureRecognizerDelegate에 있는 함수
    //키보드가 있는 공간에 입력 필드가 있는 경우 사용

    //stackview안에있는 텍스트 필드가 위로 올라감.
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.stackViewConst.constant = -100
        })
        
        self.view.layoutIfNeeded()
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.stackViewConst.constant = 0
        })
    
            self.view.layoutIfNeeded()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: emailTxtField))! || (touch.view?.isDescendant(of: passwdTxtField))! {
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
    
    
}
extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}


