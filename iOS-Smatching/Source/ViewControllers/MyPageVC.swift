//
//  MyPageVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
import Lottie
class MyPageVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var SearchImg: UIImageView!
    @IBOutlet weak var scrapedNoticeTableView: UITableView!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var noticeCnt: UILabel!
    @IBOutlet weak var searchScrapTxtField: UITextField!
    
    var animationView: LOTAnimationView = LOTAnimationView(name: "loading");
    
    var noticeList = [Notice]()
    
    var email : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        MypageService.shared.getUserInfo() {[weak self] (data) in guard let `self` = self else {return}
            self.animateLoading(self.animationView)
            print(data)
            self.nicknameLabel.text = self.gsno(data.nickname)
            self.profileImg.imageFromUrl(self.gsno(data.profileUrl), defaultImgPath: "")
            self.profileImg.layer.cornerRadius = self.profileImg.frame.height / 2
            self.profileImg.layer.masksToBounds = true
            self.noticeCnt.text = "총 \(self.gino(data.noticeScrapCnt))건"
            self.stopLoadingAnimation(self.animationView)
        }
        MypageService.shared.getScrappedNotices(request_num: 999, exist_num: 0) {[weak self] (data) in guard let `self` = self else {return}
            self.noticeList = data
            self.scrapedNoticeTableView.reloadData()
            
            
        }
        
    }
    
    func setupView() {
        
        scrapedNoticeTableView.dataSource = self
        
        searchScrapTxtField.delegate = self
        
        initGestureRecognizer()
    }
    
    
  
    @IBAction func showSettingView(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Setting", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SettingVC") as! SettingViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func updateProfile(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Setting", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MypageSettingVC") as! MypageSettingVC
        self.present(nextViewController, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard searchScrapTxtField.text?.isEmpty != true else {return false}
        SearchService.shared.getMyScrapNotices(query: self.searchScrapTxtField.text!, request_num: 999, exist_num: 0) {[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.noticeList = data
            self.scrapedNoticeTableView.reloadData()
        }
        return true
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.applyCustomClearbutton()
        guard searchScrapTxtField.text?.isEmpty == true else{ SearchImg.isHidden = true
            return true
        }
        SearchImg.isHidden = false
        return true
    }
}
extension MyPageVC : UITableViewDelegate {
    
}

extension MyPageVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        
        let notice = noticeList[indexPath.row]
        
        cell.titleLabel.text = gsno(notice.title)
        cell.institutionLabel.text = gsno(notice.institution)
        
        if gino(notice.dday) > 1000 {
            cell.ddayLabel.text = "예산소진시"
        }
        else {
            cell.ddayLabel.text = "D - " + "\(gino(notice.dday))"
        }
        
        if gino(notice.scrap) == 0 {
            cell.scrapActiveBtn.isHidden = true
            cell.scrapDeactiveBtn.isHidden = false
        }
        else {
            cell.scrapActiveBtn.isHidden = false
            cell.scrapDeactiveBtn.isHidden = true
        }
        
        return cell
    }
}
extension MyPageVC: UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        
    }
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        //입력할 수 있는 기능을 없앰
        self.searchScrapTxtField.resignFirstResponder()
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: searchScrapTxtField))! {
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
