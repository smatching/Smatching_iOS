//
//  SearchVCV.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 29..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var recentSearchWordView: UIView!
    @IBOutlet weak var searchResultView: UIView!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet var SearchImg: UIImageView!
    @IBOutlet var SearchTxtField: UITextField!
    @IBOutlet var UnderlineOfText: UIView!
    @IBOutlet weak var noSearchResult: UIView!
    
    var noticeCnt : Int?
    
    var noticeList = [Notice]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    func setupView() {
        initGestureRecognizer()
        
        noSearchResult.isHidden = true
        searchResultView.isHidden = true
        
        SearchTxtField.delegate = self
        
        SearchTxtField.addTarget(self, action: #selector(whenTxtFieldTapped), for: UIControl.Event.touchDown)
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    @IBAction func clickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @objc func whenTxtFieldTapped () {
        UnderlineOfText.backgroundColor = UIColor(red: 64/255, green: 178/255, blue: 204/255, alpha: 1)
        SearchImg.isHidden = true
        SearchTxtField.placeholder = ""
        SearchTxtField.applyCustomClearbutton()
    }
    //textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard SearchTxtField.text?.isEmpty != true else {return false}
        SearchService.shared.getSearchResultCount(query: self.SearchTxtField.text!){[weak self] (res) in guard let `self` = self else {return}
            
            self.noticeCnt = self.gino(res.num)
        
        }
        if self.gino(self.noticeCnt) == 0{
            self.noSearchResult.isHidden = false
            self.searchResultView.isHidden = true
        }
        
        SearchService.shared.getSearchResult(query: self.SearchTxtField.text!, request_num: 4, exist_num: 0 ) { [weak self] (res) in guard let `self` = self else {return}
            self.noticeList = res
            self.searchTableView.reloadData()
        }
        if self.noticeList.isEmpty == false{
            self.noSearchResult.isHidden = true
            self.searchResultView.isHidden = false
        }
        return true
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
extension SearchVC : UITableViewDelegate {
    
}
extension SearchVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        
        let notice = self.noticeList[indexPath.row]
        
        cell.titleLabel.text = gsno(notice.title)
        
        cell.institutionLabel.text = gsno(notice.institution)
        
        if gino(notice.dday) > 1000 {
            cell.ddayLabel.text = "예산소진시"
        }
        else {
            cell.ddayLabel.text = "D - " + "\(gino(notice.dday))"
        }
        
        return cell
        
    }
}
