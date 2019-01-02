//
//  SearchViewController.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 2019. 1. 2..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var SearchTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeRightBarButton()
        changeBackButtonImage()
    }
    
    func changeRightBarButton () {
        let noticeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icnIosNotice"), style: .plain, target: self, action: #selector(action(_:)))
        navigationItem.rightBarButtonItem = noticeButton
    }
    func changeBackButtonImage () {
        
        let backBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "btnBack"), style: .plain, target: self, action: #selector(BackButtonAction(_:)))
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    @IBAction func action(_ sender: AnyObject) {
        
    }
    
    @IBAction func BackButtonAction(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
}
