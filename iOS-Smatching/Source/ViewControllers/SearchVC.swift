//
//  SearchVCV.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTxtField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTxtField.invalidFieldAlert()
        // Do any additional setup after loading the view.
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
