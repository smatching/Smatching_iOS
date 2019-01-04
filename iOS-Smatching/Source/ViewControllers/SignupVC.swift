//
//  SignupVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SignupVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var stackViewConst: NSLayoutConstraint!
    @IBOutlet weak var passwdTxtField2: UITextField!
    @IBOutlet weak var passwdTxtField1: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var nicknameTxtField: UITextField!
    @IBOutlet weak var createDeactiveBtn: UIButton!
    @IBOutlet weak var createActiveBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
        
        textFieldAddTarget(nicknameTxtField)
        textFieldAddTarget(emailTxtField)
        textFieldAddTarget(passwdTxtField1)
        textFieldAddTarget(passwdTxtField2)
        
        createDeactiveBtn.isHidden = false
        createActiveBtn.isHidden = true
        emailTxtField.delegate = self
        nicknameTxtField.delegate = self
        passwdTxtField1.delegate = self
        passwdTxtField2.delegate = self
        // Do any additional setup after loading the view.
        LightGrayTextField(nicknameTxtField)
        LightGrayTextField(emailTxtField)
        LightGrayTextField(passwdTxtField1)
        LightGrayTextField(passwdTxtField2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard nicknameTxtField.text?.isEmpty != true else {return false}
        guard emailTxtField.text?.isEmpty != true else {return false}
        guard emailTxtField.text!.validateEmail() == true else {
            emailTxtField.text = ""
            emailTxtField.placeholder = "이메일 형식 틀림"
            RedTextField(emailTxtField)
            return false}
        guard passwdTxtField1.text?.isEmpty != true else {return false}

        guard passwdTxtField1.text! == passwdTxtField2.text! else {
            passwdTxtField2.text = ""
            passwdTxtField2.placeholder = "비밀번호 불일치"
            RedTextField(passwdTxtField2)
            return false}
        createDeactiveBtn.isHidden = true
        createActiveBtn.isHidden = false
        return true
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func signup(_ sender: Any) {
        UserService.shared.signUp(nickname: nicknameTxtField.text!, email: emailTxtField.text!, password: passwdTxtField1.text!){
        }
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
        
    }
    
    //타이핑 중에 일어나는 TextField Delegate
    //타이핑 중이면 파란색으로 바뀐다.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        CheckBothPasswdEqual()
        let currentText = passwdTxtField1.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {return true}
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 10
    }
    //타이핑이 끝나면 일어나는 TextField Delegate
    //비어있으면 빨강, 그렇지 않으면 파랑
    //두 비밀번호가 같으면 파랑, 다르면 빨강
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            RedTextField(textField)
        } else {
            BlueTextField(textField)
//            CheckBothPasswdEqual()
        }
        
    }
    
    //비밀번호, 비밀번호 확인 값이 서로 같은지 검사
//    func CheckBothPasswdEqual () {
//        if passwdTxtField1.text != passwdTxtField2.text {
//            RedTextField(passwdTxtField2)
//        }
//    }
    
    // TextField 우측 지우기버튼
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.applyCustomClearbutton()
        return true
    }
    
    
    
    func textFieldAddTarget (_ textField: UITextField) {
        textField.addTarget(self, action: #selector(whenTxtFieldTapped(_:)), for: UIControl.Event.touchDown)
    }
    @objc func whenTxtFieldTapped (_ textField: UITextField) {
        BlueTextField(textField)
        textField.placeholder = ""
    }
    
    
    //TextField 색깔 지정 함수
    func BlueTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1).cgColor
    }
    func RedTextField (_ textField: UITextField){
        textField.layer.borderColor = UIColor(red: 229/255, green: 136/255, blue: 136/255, alpha: 1).cgColor
    }
    func LightGrayTextField (_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    
    
    
    
    
}
extension SignupVC : UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.emailTxtField.resignFirstResponder()
        self.nicknameTxtField.resignFirstResponder()
        self.passwdTxtField2.resignFirstResponder()
        self.passwdTxtField1.resignFirstResponder()
    }

    //탭 제스쳐가 먹히는 상황과 아닌 상황을 판단
    //UIGestureRecognizerDelegate에 있는 함수
    //키보드가 있는 공간에 입력 필드가 있는 경우 사용
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

        if (touch.view?.isDescendant(of: emailTxtField))! || (touch.view?.isDescendant(of: passwdTxtField2))! || (touch.view?.isDescendant(of: passwdTxtField1))! || (touch.view?.isDescendant(of: nicknameTxtField))! {
            return false
        }
        return true
    }
    
    //stackview안에있는 텍스트 필드가 위로 올라감.
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.stackViewConst.constant = -120
            
        })
        
        //stacview의 constraint의 constant값을 변경시킴
        //위로 올림 -> - 값
        
        
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
extension UITextField {
    func applyCustomClearbutton () {
        clearButtonMode = .never
        rightViewMode = .always

        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        clearButton.setImage(UIImage(named: "btnX1"), for: .normal)
        clearButton.addTarget(self, action: #selector(clearClicked(sender:)), for: .touchUpInside)

        rightView = clearButton
    }

    @objc func clearClicked (sender : UIButton) {
        text = ""
    }
}
