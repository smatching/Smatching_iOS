//
//  WalkThroughVC.swift
//  iOS-Smatching
//
//  Created by SangIl Mo on 12/01/2019.
//  Copyright © 2019 shineeseo. All rights reserved.
//

import UIKit

class WalkThroughVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UserDefaults.standard.string(forKey: "token") )
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToFirstPage(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)

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
