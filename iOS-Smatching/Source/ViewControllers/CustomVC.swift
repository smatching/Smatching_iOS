//
//  CustomVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {
    
    var cur_cond_idx : Int?
    var conditionList = [Condition]()
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swipe 처리
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        if (UserDefaults.standard.string(forKey: "token") as? String) != nil {
            UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
                self.conditionList = data.condSummaryList!
                if self.conditionList.isEmpty == false {
                    
//                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SmatchingListVC") as! SmatchingListVC
//                    nextViewController.cond_idx = self.gino(self.cur_cond_idx);
//
//                    self.navigationController?.pushViewController(nextViewController, animated: true)

                }
            }
        }

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            pageControl.currentPage = 0
            self.cur_cond_idx = self.gino(self.conditionList[0].condIdx)
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            pageControl.currentPage = 1
            self.cur_cond_idx = self.gino(self.conditionList[1].condIdx)
        }
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SmatchingListVC") as! SmatchingListVC
//        nextViewController.cond_idx = self.gino(self.cur_cond_idx);
//
//        self.navigationController?.pushViewController(nextViewController, animated: true)

    }


}

