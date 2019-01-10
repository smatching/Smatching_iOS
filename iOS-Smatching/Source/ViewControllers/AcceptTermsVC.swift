//
//  AcceptTermsVC.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 8..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class AcceptTermsVC: UIViewController {

    @IBOutlet var AcceptTermView: UIView!
    @IBOutlet var GoToNextPage: UIButton!
    @IBOutlet var AcceptCheckBox: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
    }
    var informIfBoxIsChecked = false
    
    @IBAction func clickAcceptTermsCheckBox(_ sender: UIButton) {
        if informIfBoxIsChecked == false {
            GoToNextPage.setImage(UIImage(named: "btnNextClick"), for: .normal)
            AcceptCheckBox.setImage(UIImage(named: "icn_checkbox_blue"), for: .normal)
            informIfBoxIsChecked = true
        } else {
            GoToNextPage.setImage(UIImage(named: "btnNext"), for: .normal)
            AcceptCheckBox.setImage(UIImage(named: "icn_emptybox"), for: .normal)
            informIfBoxIsChecked = false
        }
        
    }
    
    @IBAction func CompleteSignUp(_ sender: UIButton) {
        if informIfBoxIsChecked == true {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    

}
