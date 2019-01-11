//
//  HomeVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
import Lottie
import UserNotifications

class HomeVC: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var noConditionView: UIView!
    @IBOutlet weak var conditionAdaptView: UIView!
    @IBOutlet weak var noNoticeList: UIView!
    @IBOutlet weak var noticeAllTableView: UITableView!
    @IBOutlet weak var noticeTableView: UITableView!
    @IBOutlet weak var noticeListCnt: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var goToConditionEdit: UILabel!
    @IBOutlet weak var conditionTitle: UILabel!
    
    var animationView: LOTAnimationView = LOTAnimationView(name: "splash");
    
    var noticeList = [Notice]()
    var conditionList = [Condition]()
    var noticeFitList = [Notice]()
    
    var cur_cond_idx : Int?
    var cur_notice_idx : Int?
    
    //읽지 않은 공고 개수
    var badgeCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShadow()
        
        NotificationPutService.shared.getNotificationCount() {[weak self] (res) in guard let `self` = self else {return}
            self.badgeCount = self.gino(res.num)
            let application = UIApplication.shared
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                // Enable or disable features based on authorization.
            }
            application.registerForRemoteNotifications()
            application.applicationIconBadgeNumber = self.gino(self.badgeCount)
        }
        
        
        //전체 공고 불러오기
        NoticeService.shared.getAllNotice(request_num: 4, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList = data
            self.noticeAllTableView.reloadData()
        }
        
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(showEditConditionView(_:)))
        //
        //        goToConditionEdit.addGestureRecognizer(tap)
    }
    
    //    @objc func showEditConditionView(_ sender : UITapGestureRecognizer ) {
    //        print("tap")
    //        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    //        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomSettingVC") as! CustomSettingVC
    //        nextViewController.cur_cond_idx = self.gino(self.cur_cond_idx);
    //
    //        self.present(nextViewController, animated: true, completion: nil)
    //    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

        UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
            
            self.conditionList = data.condSummaryList!
            self.nicknameLabel.text = self.gsno(data.nickname)
            if self.conditionList.count < 1 && self.pageControl.currentPage == 1 {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = false
            }
                
            else {
                if self.conditionList.isEmpty == false {
                    self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
                    if self.gino(self.conditionList[0].noticeCnt) == 0 {
                        self.noNoticeList.isHidden = false
                        self.conditionAdaptView.isHidden = true
                        self.noConditionView.isHidden = true
                    }
                    else {
                        self.cur_cond_idx = self.gino(self.conditionList[0].condIdx)
                        self.noticeListCnt.text = "\(self.gino(self.conditionList[0].noticeCnt))개"
                        NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: 0 ) {[weak self] (data) in guard let `self` = self else {return}
                            self.noticeFitList = data
                            self.noticeTableView.reloadData()
                        }
                        self.noNoticeList.isHidden = true
                        self.conditionAdaptView.isHidden = false
                        self.noConditionView.isHidden = true
                    }
                }
                else {
                    self.noNoticeList.isHidden = true
                    self.conditionAdaptView.isHidden = true
                    self.noConditionView.isHidden = false
                }
            }
            
        }
        
    }
    
    func setupShadow() {
        //뷰 쉐도우 처리
        noConditionView.layer.shadowColor = UIColor.black.cgColor
        noConditionView.layer.shadowOpacity = 0.1
        noConditionView.layer.shadowRadius = 5
        noConditionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        noConditionView.layer.masksToBounds = false
        
        conditionAdaptView.layer.shadowColor = UIColor.black.cgColor
        conditionAdaptView.layer.shadowOpacity = 0.1
        conditionAdaptView.layer.shadowRadius = 5
        conditionAdaptView.layer.shadowOffset = CGSize(width: 0, height: 0)
        conditionAdaptView.layer.masksToBounds = false
        
        noNoticeList.layer.shadowColor = UIColor.black.cgColor
        noNoticeList.layer.shadowOpacity = 0.1
        noNoticeList.layer.shadowRadius = 5
        noNoticeList.layer.shadowOffset = CGSize(width: 0, height: 0)
        noNoticeList.layer.masksToBounds = false
        
        noticeAllTableView.layer.shadowColor = UIColor.black.cgColor
        noticeAllTableView.layer.shadowOpacity = 0.1
        noticeAllTableView.layer.shadowRadius = 5
        noticeAllTableView.layer.shadowOffset = CGSize(width: 0, height: 0)
        noticeAllTableView.layer.masksToBounds = false
        
        //초기화면설정
        self.noNoticeList.isHidden = true
        self.conditionAdaptView.isHidden = true
        self.noConditionView.isHidden = false
        
        noticeAllTableView.delegate = self
        noticeTableView.delegate = self
        noticeAllTableView.dataSource = self
        noticeTableView.dataSource = self
        
        //swipe 처리
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            self.pageControl.currentPage = 0
            if self.conditionList.isEmpty == false {
                self.noticeListCnt.text = "\(self.gino(self.conditionList[0].noticeCnt))개"
                self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
                
                if self.gino(self.conditionList[0].noticeCnt) == 0 {
                    self.noNoticeList.isHidden = false
                    self.conditionAdaptView.isHidden = true
                    self.noConditionView.isHidden = true
                }
                else {
                    self.cur_cond_idx = self.conditionList[0].condIdx
                    NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: 0 ) {[weak self] (data) in guard let `self` = self else {return}
                        self.noticeFitList = data
                        self.noticeTableView.reloadData()
                    }
                    self.noNoticeList.isHidden = true
                    self.conditionAdaptView.isHidden = false
                    self.noConditionView.isHidden = true
                }
            }
            else {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = false
            }
            
        }
            
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            self.pageControl.currentPage = 1
            if self.conditionList.count > 1 {
                
                self.noticeListCnt.text = "\(self.gino(self.conditionList[1].noticeCnt))개"
                self.conditionTitle.text = self.gsno(self.conditionList[1].condName)
                
                if self.gino(self.conditionList[1].noticeCnt) == 0 {
                    self.noNoticeList.isHidden = false
                    self.conditionAdaptView.isHidden = true
                    self.noConditionView.isHidden = true
                }
                else {
                    self.cur_cond_idx = self.conditionList[1].condIdx
                    NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: 0 ) {[weak self] (data) in guard let `self` = self else {return}
                        self.noticeFitList = data
                        self.noticeTableView.reloadData()
                    }
                    self.noNoticeList.isHidden = true
                    self.conditionAdaptView.isHidden = false
                    self.noConditionView.isHidden = true
                }
            }
            else {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = false
                
            }
            
        }
        
    }
    
    @IBAction func clickNotificationBtn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Alarm", bundle:nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "AlarmVC")
        addChild(controller)
        controller.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        controller.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Search", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func viewSmatchingBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SmatchingListVC") as! SmatchingListVC
        nextViewController.cond_idx = self.gino(self.cur_cond_idx);
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
extension HomeVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetailContent", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NoticeDetailVC") as! NoticeDetailVC
        
        if tableView == noticeTableView {
            let notice = self.noticeFitList[indexPath.row]
            nextViewController.notice_idx = gino(notice.noticeIdx)
        } else {
            let notice = self.noticeList[indexPath.row]
            nextViewController.notice_idx = gino(notice.noticeIdx)
        }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == noticeAllTableView {
            return noticeList.count
        }
        else {
            return noticeFitList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == noticeAllTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeDownCell", for: indexPath) as! NoticeCell
            let notice = noticeList[indexPath.row]
            
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
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeUpCell", for: indexPath) as! NoticeCell
            let notice = noticeFitList[indexPath.row]
            
            
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
}
