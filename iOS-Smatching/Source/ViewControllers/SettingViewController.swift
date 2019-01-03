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
        simpleAlert("", "회원탈퇴 하시겠습니까?", completion: nil)
    }
    @IBAction func Logout(_ sender: UIButton) {
        simpleAlert("", "로그아웃 하시겠습니까?", completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
