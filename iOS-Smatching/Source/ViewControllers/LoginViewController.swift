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
        
        loginDeactiveBtn.isHidden = false
        loginActiveBtn.isHidden = true
        
        passwdTxtField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
