//
//  LoginOrSignupVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 26..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class LoginOrSignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToAcceptTermPage(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "AcceptTerms", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AcceptTermsVC") as! AcceptTermsVC
        
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
}
