//
//  SignupVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SignupVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwdTxtField2: UITextField!
    @IBOutlet weak var passwdTxtField1: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var nicknameTxtField: UITextField!
    @IBOutlet weak var createDeactiveBtn: UIButton!
    @IBOutlet weak var createActiveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDeactiveBtn.isHidden = false
        createActiveBtn.isHidden = true
        passwdTxtField2.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createDeactiveBtn.isHidden = true
        createActiveBtn.isHidden = false
        return true
    }
    
    
    @IBAction func signup(_ sender: Any) {
        UserService.shared.signUp(nickname: nicknameTxtField.text!, email: emailTxtField.text!, password: passwdTxtField1.text!){(res) in print(self.gsno(res.nickname))
            UserDefaults.standard.set(self.gsno(res.nickname), forKey: "nickname")
        }
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
        
    }
    
}
