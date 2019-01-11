//
//  SplashVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 11..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    var animationView: LOTAnimationView = LOTAnimationView(name: "loading")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateLoading(animationView)
       
    }
   
    
}
