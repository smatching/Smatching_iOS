//
//  LoginViewController.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwdTxtField: UITextField!
    
    @IBOutlet weak var loginDeactiveBtn: UIButton!
    @IBOutlet weak var loginActiveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "btnBack")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "btnBack")
        initGestureRecognizer()
        
        loginDeactiveBtn.isHidden = false
        loginActiveBtn.isHidden = true
        
        emailTxtField.delegate = self
        passwdTxtField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard emailTxtField.text?.isEmpty != true else {return false}
        guard passwdTxtField.text?.isEmpty != true else {return false}
        
        loginActiveBtn.isHidden = false;
        loginDeactiveBtn.isHidden = true;
        return true
    }

    
    
    @IBAction func login(_ sender: Any) {
        LoginService.shared.login(email : emailTxtField.text!, password : passwdTxtField.text! ) {(token) in
            print(self.gsno(token.token))
            
            UserDefaults.standard.set(self.gsno(token.token), forKey: "token")
            
        }
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
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
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: emailTxtField))! || (touch.view?.isDescendant(of: passwdTxtField))! {
            return false
        }
        return true
    }
}
