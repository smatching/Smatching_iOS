//
//  PageViewController.swift
//  PageControl
//
//  Created by Andrew Seeley on 2/2/17.
//  Copyright © 2017 Seemu. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var pageControl = UIPageControl()
    
    // MARK: UIPageViewControllerDataSource
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "WalkThrough1"),
                self.newVc(viewController: "WalkThrough2"),
                self.newVc(viewController: "WalkThrough3"),
                self.newVc(viewController: "WalkThrough4")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        configurePageControl()
        
        // Do any additional setup after loading the view.
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        if self.newVc(viewController: "WalkThrough1").isViewLoaded == true {
            self.pageControl.isHidden = true
        }else {
            pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.minY + 50 ,width: UIScreen.main.bounds.width ,height: 5))
            self.pageControl.numberOfPages = orderedViewControllers.count
            self.pageControl.currentPage = 0
            self.pageControl.hidesForSinglePage = true
            self.pageControl.tintColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1)
            self.pageControl.pageIndicatorTintColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
            self.pageControl.currentPageIndicatorTintColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1)
            self.view.addSubview(pageControl)
        }
    }
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "walkThrough", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    // MARK: Delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {

            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
}
