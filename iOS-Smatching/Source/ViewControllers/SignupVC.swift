//
//  SignupVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var passwdTxtField2: UITextField!
    @IBOutlet weak var passwdTxtField1: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var nicknameTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signup(_ sender: Any) {
        UserService.shared.signUp(nickname: nicknameTxtField.text!, email: emailTxtField.text!, password: passwdTxtField1.text!){(res) in print(self.gsno(res.nickname))
            UserDefaults.standard.set(self.gsno(res.nickname), forKey: "nickname")
        }
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
