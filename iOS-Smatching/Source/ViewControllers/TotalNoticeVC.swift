//
//  TotalNoticeVC.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 5..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import UIKit

class TotalNoticeVC: UIViewController, UIScrollViewDelegate, NoticeCellDelegate {

    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var totalNoticeTableView: UITableView!
    var noticeList = [Notice]()
    var checked : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        totalNoticeTableView.delegate = self
        totalNoticeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
       
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        NoticeService.shared.getAllNotice(request_num: 999, exist_num: 0) {[weak self] (data) in guard let `self` = self else {return}
            print(data)
            self.noticeList = data
            self.totalCountLabel.text = "총 \(self.noticeList.count)건"
            self.totalNoticeTableView.reloadData()
            
        }
    }

    //스크랩 버튼 클릭시 동작
    func doScrapNotice(noticeIdx: IndexPath) {
        let idx = noticeIdx.row
        NoticeService.shared.putNoticeScrap(noticeIdx: idx) {
            [weak self] (data) in guard let `self` = self else {return}
            print(data.scrap)
        }
        
    }
    
    @IBAction func dismissAction(_ sender: Any) {
         dismiss(animated: true, completion: nil )
    }
//    //무한 스크롤링
//    var pageIndex: Int = 1
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//
//        if offsetY > contentHeight - scrollView.frame.size.height {
//            /* increment page index to load new data set from */
//            pageIndex += 1
//
//            /* call API to load data from next page or just add dummy data to your datasource */
//            /* Needs to be implemented */
//            loadNewItemsFrom(pageIndex)
//
//            /* reload tableview with new data */
//            self.totalNoticeTableView.reloadData()
//        }
//    }
//
//    func loadNewItemsFrom(_: Int) {
//        NoticeService.shared.getAllNotice(request_num: 20, exist_num: self.noticeList.count) {[weak self] (data) in guard let `self` = self else {return}
//
//            self.noticeList += data
//            print(self.noticeList.count)
//            self.totalNoticeTableView.reloadData()
//
//        }
//    }
}
extension TotalNoticeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetailContent", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NoticeDetailVC") as! NoticeDetailVC
        
        let notice = self.noticeList[indexPath.row]
        nextViewController.notice_idx = gino(notice.noticeIdx)
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
}
extension TotalNoticeVC : UITableViewDataSource {
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
        
        cell.delegate = self
        cell.noticeIdx = indexPath
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
