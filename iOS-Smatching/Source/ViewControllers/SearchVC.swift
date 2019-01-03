//
//  SearchVCV.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var SearchResultView: UIView!
    @IBOutlet var SearchImg: UIImageView!
    @IBOutlet var SearchTxtField: UITextField!
    @IBOutlet var UnderlineOfText: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
        SearchTxtField.addTarget(self, action: #selector(whenTxtFieldTapped), for: UIControl.Event.touchDown)
        // Do any additional setup after loading the view.
        SearchResultView.layer.shadowRadius = 5
        SearchResultView.layer.shadowOffset = CGSize(width: 0, height: 3)
        SearchResultView.layer.shadowColor = UIColor.black.cgColor
        SearchResultView.layer.shadowOpacity = 0.3
    }
    
    @objc func whenTxtFieldTapped () {
        UnderlineOfText.backgroundColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1)
        SearchImg.isHidden = true
        SearchTxtField.placeholder = ""
        SearchTxtField.applyCustomClearbutton()
    }
    
    
   
}
extension SearchVC: UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        
    }
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.SearchTxtField.resignFirstResponder()
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: SearchTxtField))! {
            return false
        }
        
        return true
    }
    func registerForKeyboardNotifications() {
        //addObserver - 특정 동작에 selector추가 -> 계속 지켜보고 있으면서 특정 상황이 오면 실행된다.
        //addObserver - 다른 view controller로 가기 전에 이걸 없애줘야 한다. removeObserver
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        self.view.layoutIfNeeded()
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
        self.view.layoutIfNeeded()
    }
    
}


