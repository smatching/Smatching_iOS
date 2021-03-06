//
//  SettingViewController.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 3..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBAction func Withdrawl(_ sender: UIButton) {
        simpleAlert("", "회원탈퇴 하시겠습니까?",  completion: { (action) in
            UserService.shared.leaveThisAppCompletely() {
                UserDefaults.standard.removeObject(forKey: "token")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginOrSignupVC") as! LoginOrSignupVC
                
                self.present(nextViewController, animated: true, completion: nil)
            }
        })
    }
    @IBAction func Logout(_ sender: UIButton) {
        simpleAlert("", "로그아웃 하시겠습니까?",  completion: { (action) in
            UserDefaults.standard.removeObject(forKey: "token")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginOrSignupVC") as! LoginOrSignupVC
            
            self.present(nextViewController, animated: true, completion: nil)
            
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    @IBAction func gotoAcceptTermView(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "AcceptTerms", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptTermsView")
        
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    @IBAction func gotoPrivatePolicy(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "AcceptTerms", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "privacyPolicyView")
        
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    

}
