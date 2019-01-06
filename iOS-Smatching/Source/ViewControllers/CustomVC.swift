//
//  CustomVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {

    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.isHidden = false
        secondView.isHidden = true
        if let button = self.navigationItem.leftBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        }
        if let button = self.navigationItem.rightBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        
        
    }

    @IBAction func showConditionMenu(_ sender: Any) {
        if let button = self.navigationItem.leftBarButtonItem {
            button.isEnabled = true
            button.tintColor = UIColor.gray
        }
        if let button = self.navigationItem.rightBarButtonItem {
            button.isEnabled = true
            button.tintColor = UIColor.blue
        }
        firstView.isHidden = true
        secondView.isHidden = false
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        if let button = self.navigationItem.leftBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        }
        if let button = self.navigationItem.rightBarButtonItem {
            button.isEnabled = false
            button.tintColor = UIColor.clear
        }
        firstView.isHidden = false
        secondView.isHidden = true
    }
}

