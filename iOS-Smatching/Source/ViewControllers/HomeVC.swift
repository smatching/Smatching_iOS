//
//  HomeVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit
import Lottie
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
    
    var noticeList = [Notice]()
    var conditionList = [Condition]()
    var noticeFitList = [Notice]()
    
    var cur_cond_idx : Int?
    var cur_notice_idx : Int?
    let animationView = LOTAnimationView(name: "loading")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        noticeAllTableView.delegate = self
        noticeTableView.delegate = self
        noticeAllTableView.dataSource = self
        noticeTableView.dataSource = self
        
        
        
        //로딩 화면
        //        self.view.addSubview(animationView)
        
        UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
            //                self.animationView.play()
            print(data)
            self.conditionList = data.condSummaryList!
            self.nicknameLabel.text = self.gsno(data.nickname)
            self.noticeListCnt.text = "\(self.gino(self.conditionList[0].noticeCnt))개"
            self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
            
            self.cur_cond_idx = self.conditionList[0].condIdx
            
            if data.condSummaryList?.isEmpty == false {
                NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: self.noticeFitList.count ) {[weak self] (data) in guard let `self` = self else {return}
                    self.noticeFitList = data
                    self.noticeTableView.reloadData()
                    self.noNoticeList.isHidden = true
                    self.conditionAdaptView.isHidden = false
                    self.noConditionView.isHidden = true
                }
                if self.gino(self.conditionList[0].noticeCnt) == 0 {
                    self.noNoticeList.isHidden = false
                    self.conditionAdaptView.isHidden = true
                    self.noConditionView.isHidden = true
                }
            }
            else {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = false
            }
        }
        
        
        //swipe 처리
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
            self.conditionList = data.condSummaryList!
            self.nicknameLabel.text = self.gsno(data.nickname)
            
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                print("Swipe Right")
                self.pageControl.currentPage = 0
                
                if data.condSummaryList?.isEmpty == false {
                    self.noticeListCnt.text = "\(self.gino(self.conditionList[0].noticeCnt))개"
                    self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
                    
                    self.cur_cond_idx = self.conditionList[0].condIdx
                    NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: self.noticeFitList.count ) {[weak self] (data) in guard let `self` = self else {return}
                        self.noticeFitList = data
                        self.noticeTableView.reloadData()
                        self.noNoticeList.isHidden = true
                        self.conditionAdaptView.isHidden = false
                        self.noConditionView.isHidden = true
                    }
                    if self.gino(self.conditionList[0].noticeCnt) == 0 {
                        self.noNoticeList.isHidden = false
                        self.conditionAdaptView.isHidden = true
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
                
                if self.conditionList.isEmpty == false && self.conditionList.count > 1{
                    self.noticeListCnt.text = "\(self.gino(self.conditionList[1].noticeCnt))개"
                    self.conditionTitle.text = self.gsno(self.conditionList[1].condName)
                    
                    self.cur_cond_idx = self.conditionList[1].condIdx
                    NoticeService.shared.getFitNotice(cond_idx: self.gino(self.cur_cond_idx), request_num: 3, exist_num: self.noticeFitList.count ) {[weak self] (data) in guard let `self` = self else {return}
                        self.noticeFitList = data
                        self.noticeTableView.reloadData()
                        self.noNoticeList.isHidden = true
                        self.conditionAdaptView.isHidden = false
                        self.noConditionView.isHidden = true
                    }
                    if self.gino(self.conditionList[0].noticeCnt) == 0 {
                        self.noNoticeList.isHidden = false
                        self.conditionAdaptView.isHidden = true
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        NoticeService.shared.getAllNotice(request_num: 4, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList = data
            self.noticeAllTableView.reloadData()
        }
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Search", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func viewSmatchingBtn(_ sender: Any) {
        print(self.cur_cond_idx)
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
            print(notice.noticeIdx)
            nextViewController.notice_idx = gino(notice.noticeIdx)
        } else {
            let notice = self.noticeList[indexPath.row]
            print(notice.noticeIdx)
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
