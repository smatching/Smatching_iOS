//
//  HomeVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 27..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기본 화면을 조건 선택 화면으로 이동
        noNoticeList.isHidden = true
        conditionAdaptView.isHidden = true
        noConditionView.isHidden = false
        
        noticeAllTableView.dataSource = self
        noticeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService.shared.getUserCondition() {[weak self] (data) in guard let `self` = self else {return}
            self.conditionList = data.condSummaryList!
            self.nicknameLabel.text = self.gsno(data.nickname)
            self.noticeListCnt.text = "\(self.gino(self.conditionList[0].noticeCnt))개"
            self.conditionTitle.text = self.gsno(self.conditionList[0].condName)
            
            if self.conditionList == nil {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = false
            } else if self.gino(self.conditionList[0].noticeCnt) == 0 {
                self.noNoticeList.isHidden = false
                self.conditionAdaptView.isHidden = true
                self.noConditionView.isHidden = true
            }
            else {
                self.noNoticeList.isHidden = true
                self.conditionAdaptView.isHidden = false
                self.noConditionView.isHidden = true
            }
        }
        NoticeService.shared.getAllNotice(request_num: 4, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
            
            self.noticeList = data
            self.noticeAllTableView.reloadData()
        }
        NoticeService.shared.getFitNotice(cond_idx: self.gino(self.conditionList[0].condIdx), request_num: 3, exist_num: self.noticeFitList.count ) {[weak self] (data) in guard let `self` = self else {return}
            
            print(data)
            self.noticeFitList = data
            self.noticeTableView.reloadData()
        }
        
    }
    
}
extension HomeVC : UITableViewDelegate {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
            let notice = noticeList[indexPath.row]
            
            cell.titleLabel.text = self.gsno(notice.title)
            cell.institutionLabel.text = self.gsno(notice.institution)
            if self.gino(notice.dday) > 1000 {
                cell.ddayLabel.text = "예산소진시"
            }
            else {
                cell.ddayLabel.text = "D - " + "\(self.gino(notice.dday))"
            }
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCellMain", for: indexPath) as! NoticeCell
            let notice = noticeFitList[indexPath.row]
            
            cell.titleLabel.text = self.gsno(notice.title)
            cell.institutionLabel.text = self.gsno(notice.institution)
            if self.gino(notice.dday) > 1000 {
                cell.ddayLabel.text = "예산소진시"
            }
            else {
                cell.ddayLabel.text = "D - " + "\(self.gino(notice.dday))"
            }
            
            return cell
        }
        
    }
    
    
}
